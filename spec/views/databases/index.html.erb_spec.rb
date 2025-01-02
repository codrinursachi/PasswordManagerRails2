require 'rails_helper'

RSpec.describe "databases/index", type: :view do
  before(:each) do
    assign(:databases, [
      Database.create!(
        name: "Name",
        user: nil
      ),
      Database.create!(
        name: "Name",
        user: nil
      )
    ])
  end

  it "renders a list of databases" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
