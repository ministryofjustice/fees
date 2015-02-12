require 'rails_helper'

RSpec.describe SearchController, :type => :controller do
  render_views

  describe "GET fees" do
    before(:each) { get :fees }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should contain the search form" do
      expect(response.body).to include 'Fee search'
    end
  end

  describe "GET fee_results" do
    before(:each) { get :fee_results, query: 'foo'}

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      expect(response.body).to include 'Search results for: foo'
    end
  end

end
