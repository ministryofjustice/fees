require 'rails_helper'

RSpec.describe FeeTypesController, :type => :controller do
  render_views

  describe "GET show" do
    let(:category) { FeeCategory.create!(title: 'General Applications') }
    let!(:fee) do
      FeeType.create!(fee_category_id: category.id,
                      title: 'yes yes',
                      amount: 10)
    end

    it "returns http success" do
      get :show, id: fee.friendly_id, format: :html
      expect(response).to have_http_status(:success)
    end

    it "shows the fee" do
      get :show, id: fee.friendly_id, format: :html
      expect(response.body).to match 'yes yes'
    end
  end

end
