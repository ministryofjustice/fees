require 'rails_helper'

RSpec.describe FeeTypesController, :type => :controller do
  render_views

  let(:category) do
    FeeCategory.create!(title: 'General Applications',
                        statutory_instrument_id: 1,
                        description: 'description',
                        fee_number: '1')
  end

  let!(:fee) do
    FeeType.create!(fee_category_id: category.id,
                    title: 'yes yes',
                    amount: 35,
                    fee_number: 'a')
  end


  describe "GET show" do
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

  describe 'POST sum' do
    it 'should redirect to the fee calculation' do
      post :sum, id: fee.friendly_id, amount: '100'
      expect(response).to redirect_to fee_payable_path(fee.friendly_id, '100')
    end
  end

  describe 'GET amount' do
    before(:each) { get :show, id: fee.friendly_id, amount: '100' }

    it 'should return successful status code' do
      expect(response.status).to eq 200
    end

    it 'should return the fee that is due' do
      expect(response.body).to match '35'
    end
  end

end
