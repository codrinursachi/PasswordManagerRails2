FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    password_digest { "pass" }
  end
end
