class Task < ActiveRecord::Base
  STATUSES = %w(open done canceled)
end
