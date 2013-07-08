# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    description "MyText"
    scheduled_to ""
    status "MyString"
  end
end
