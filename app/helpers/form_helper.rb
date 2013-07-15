module FormHelper
  def select_options_for_task_statuses
    options = []
    Task::STATUSES.each do |value|
      options << [t("system.task.status.#{value}"), value]
    end
    options
  end

  def date_format
    t('date.formats.default').gsub('%d', 'dd').gsub('%m', 'mm').gsub('%Y', 'yyyy')
  end
end
