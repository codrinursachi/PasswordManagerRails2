require 'rails_helper'

RSpec.describe "passwords/index", type: :view do
  before(:each) do
    assign(:passwords, [
      Password.create!(
        url: "Url",
        username: "Username",
        password: "Password",
        category_path: "Category Path",
        tags: "Tags",
        favorite: false,
        notes: "MyText",
        database: nil
      ),
      Password.create!(
        url: "Url",
        username: "Username",
        password: "Password",
        category_path: "Category Path",
        tags: "Tags",
        favorite: false,
        notes: "MyText",
        database: nil
      )
    ])
  end

  it "renders a list of passwords" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Category Path".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Tags".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
