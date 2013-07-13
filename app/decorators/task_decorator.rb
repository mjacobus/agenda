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
end
