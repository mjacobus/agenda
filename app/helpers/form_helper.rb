module FormHelper
  def select_options_for_task_statuses
    Task::STATUSES
  end
end
