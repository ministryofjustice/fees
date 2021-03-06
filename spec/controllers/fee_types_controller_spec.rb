require 'rails_helper'

RSpec.describe FeeTypesController, :type => :controller do
  render_views

  describe "GET show" do
    let(:category) do
      FeeCategory.create!(title: 'General Applications',
                          statutory_instrument_id: 1,
                          description: 'description',
                          fee_number: '1')
    end

    let!(:fee) do
      FeeType.create!(fee_category_id: category.id,
                      title: 'yes yes',
                      amount: 10)
    end

    context "HTML" do
      it "returns http success" do
        get :show, id: fee.friendly_id, format: :html
        expect(response).to have_http_status(:success)
      end

      it "shows the fee" do
        get :show, id: fee.friendly_id, format: :html
        expect(response.body).to match 'yes yes'
      end
    end

    context "JSON" do
      it "returns http success" do
        get :show, id: fee.friendly_id, format: :json
        expect(response).to have_http_status(:success)
      end

      it "shows the fee" do
        get :show, id: fee.friendly_id, format: :json
        expect(response.body).to match 'yes yes'
      end
    end
  end

end
