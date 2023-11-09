require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /terms_of_use" do
    it "returns http success" do
      get "/static_page/terms_of_use"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /privacy_policy" do
    it "returns http success" do
      get "/static_page/privacy_policy"
      expect(response).to have_http_status(:success)
    end
  end
end
