FactoryBot.define do
  factory :password do
    url { "url" }
    username { "username" }
    password { "password" }
    expiration_date { Date.parse("2025-01-02") }
    category_path { "category/subcategory" }
    tags { "#tag1 #tag2 #tag3" }
    favorite { false }
    notes { "my notes" }
    database
  end
end
