# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    description "MyText"
    scheduled_to 1.day.from_now
    status Task::STATUSES.first
    user
  end
end
