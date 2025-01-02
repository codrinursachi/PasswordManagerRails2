FactoryBot.define do
  factory :password do
    url { "MyString" }
    username { "MyString" }
    password { "MyString" }
    expiration_date { "2025-01-02" }
    category_path { "MyString" }
    tags { "MyString" }
    favorite { false }
    notes { "MyText" }
    database { nil }
  end
end
