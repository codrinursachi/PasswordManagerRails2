require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/sessions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/sessions/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  it "should redirect to root after session creation" do
    user = FactoryBot.create(:user)
    post "/login", params: { username: user.username, password: user.password }
    expect(response).to redirect_to(root_path)
  end
end
