require 'rails_helper'

RSpec.describe "databases/edit", type: :view do
  let(:database) {
    Database.create!(
      name: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:database, database)
  end

  it "renders the edit database form" do
    render

    assert_select "form[action=?][method=?]", database_path(database), "post" do

      assert_select "input[name=?]", "database[name]"

      assert_select "input[name=?]", "database[user_id]"
    end
  end
end
