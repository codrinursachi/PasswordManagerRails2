require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end
  it "creates a user and redirects to root" do
    user = FactoryBot.build(:user)
    post "/users", params: { user: {username: user.username, password: user.password, password_confirmation: user.password_confirmation} }
    expect(response).to redirect_to(root_path)
  end
end
