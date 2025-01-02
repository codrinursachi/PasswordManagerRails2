require 'rails_helper'

RSpec.describe "passwords/show", type: :view do
  before(:each) do
    assign(:password, Password.create!(
      url: "Url",
      username: "Username",
      password: "Password",
      category_path: "Category Path",
      tags: "Tags",
      favorite: false,
      notes: "MyText",
      database: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Category Path/)
    expect(rendered).to match(/Tags/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
