FactoryBot.define do
  factory :database do
    sequence(:name) { |n| "DB#{n}" }
    user
  end
end
