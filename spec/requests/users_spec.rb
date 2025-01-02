require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end
  it "creates a user and redirects to root" do
    user = FactoryBot.create(:user)
    post "/users", params: { username: user.username, password: user.password }
    expect(response).to redirect_to(root_path)
  end
end
