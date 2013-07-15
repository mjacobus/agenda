class TasksController < UsersController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_default_filter_params

  def index
    @tasks = TaskQuery.new(current_user.tasks).build do |q|
      params.each do |name, value|
        if q.respond_to?(name) && value.present?
          q.send(name, value)
        end
      end
    end

    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = current_user.tasks.build
    respond_with(@task)
  end

  def edit
    respond_with(@task)
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :scheduled_to, :status)
    end

    def set_default_filter_params
      unless params[:from].present?
        params[:from] = l(Date.today)
      end

      unless params[:to].present?
        params[:to] = l(7.days.from_now.to_date)
      end
    end
end
