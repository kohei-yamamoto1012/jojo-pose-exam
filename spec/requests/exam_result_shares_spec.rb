require 'rails_helper'

RSpec.describe "ExamResultShares", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/exam_result_shares/show"
      expect(response).to have_http_status(:success)
    end
  end

end
