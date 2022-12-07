require "rails_helper"
require_relative "../helpers"

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /dashboard" do
    let(:user) { FactoryBot.create(:user) }
    send_signin_request
    it "returns http success if signed in" do
      get "/dashboard"
      expect(response).to have_http_status(:success)
    end
  end
end
