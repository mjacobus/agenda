class TaskDecorator < Draper::Decorator
  delegate_all

  def date
    h.l(scheduled_to.to_date, format: :short)
  end

  def time
    value = scheduled_to.strftime('%H:%M')
    if value == '00:00'
      value = h.t('system.task.time.any')
    end
    value
  end

  def status
    h.t("system.task.status.#{object.status}")
  end

  def date_and_time
    "#{date}, #{time}"
  end
end
