# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { generate(:email) }
    provider :facebook
    uid { generate(:uid) }
  end
end
