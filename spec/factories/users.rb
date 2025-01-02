FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    password { "pass" }
  end
end
