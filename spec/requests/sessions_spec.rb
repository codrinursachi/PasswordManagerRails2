require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /logout" do
    it "returns http success" do
      get "/logout"
      expect(response).to redirect_to(root_path)
    end
  end

  it "should redirect to root after session creation" do
    user = FactoryBot.create(:user)
    post "/login", params: { username: user.username, password: user.password }
    expect(response).to redirect_to(root_path)
  end
end
