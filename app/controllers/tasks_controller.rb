class TasksController < UsersController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = TaskQuery.new(current_user.tasks).build do |q|
      q.from params[:from] if params[:from].present?
      q.to params[:to] if params[:to].present?
      q.matching params[:q] if params[:q].present?
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
end
