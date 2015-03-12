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
    before(:each) { get :fee_results, query: 'cool'}

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      expect(response.body).to include 'Search results for: cool'
    end

    context "display results" do
      before(:all) do
        category = FeeCategory.create!(title: 'Cool',
                                       statutory_instrument_id: 1,
                                       description: 'description',
                                       fee_number: '1')
        ['super', 'mildly', 'amazingly'].each do |fee|
          fee_type = category.fee_types.build(fee_number: 'a',
                                              title: "#{fee} cool fee",
                                              amount: 10,
                                              description: 'description')
          fee_type.save
        end
      end

      it "should display the fees based on the query" do
        expect(response.body).to match /(super|mildly|amazingly)-cool-fee/im
      end
    end
  end

end
