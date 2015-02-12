require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "GET fees" do
    it "returns http success" do
      get :fees
      expect(response).to have_http_status(:success)
    end
  end

end
