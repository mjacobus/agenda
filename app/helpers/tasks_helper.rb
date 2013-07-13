module TasksHelper
  def tasks_grouped_by_scheduled_date(tasks)
    tasks.group_by{|t| t.scheduled_to.strftime('%Y-%m-%d') }
  end
end
