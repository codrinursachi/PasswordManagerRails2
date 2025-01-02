require 'rails_helper'

RSpec.describe "databases/new", type: :view do
  before(:each) do
    assign(:database, Database.new(
      name: "MyString",
      user: nil
    ))
  end

  it "renders new database form" do
    render

    assert_select "form[action=?][method=?]", databases_path, "post" do

      assert_select "input[name=?]", "database[name]"

      assert_select "input[name=?]", "database[user_id]"
    end
  end
end
