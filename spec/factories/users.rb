FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    password { "pass" }
    password_confirmation { "pass" }
  end
end
