require 'rails_helper'

RSpec.describe "passwords/new", type: :view do
  before(:each) do
    assign(:password, Password.new(
      url: "MyString",
      username: "MyString",
      password: "MyString",
      category_path: "MyString",
      tags: "MyString",
      favorite: false,
      notes: "MyText",
      database: nil
    ))
  end

  it "renders new password form" do
    render

    assert_select "form[action=?][method=?]", passwords_path, "post" do

      assert_select "input[name=?]", "password[url]"

      assert_select "input[name=?]", "password[username]"

      assert_select "input[name=?]", "password[password]"

      assert_select "input[name=?]", "password[category_path]"

      assert_select "input[name=?]", "password[tags]"

      assert_select "input[name=?]", "password[favorite]"

      assert_select "textarea[name=?]", "password[notes]"

      assert_select "input[name=?]", "password[database_id]"
    end
  end
end
