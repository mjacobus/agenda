class Task < ActiveRecord::Base
  STATUSES = %w(open done canceled)

  belongs_to :user
  validates :name, presence: true
  validates :scheduled_to, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :user, presence: true

  scope :with_status, ->(status){ where(status: status) }
end
