class User < ActiveRecord::Base
  devise :omniauthable

  has_many :tasks
end
