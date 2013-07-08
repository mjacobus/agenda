class Task < ActiveRecord::Base
  STATUSES = %w(open done canceled)

  validates :name, presence: true
  validates :scheduled_to, presence: true
  validates :status, inclusion: { in: STATUSES }

  scope :with_status, ->(status){ where(status: status) }
end
