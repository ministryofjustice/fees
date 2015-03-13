# coding: utf-8
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
                    fee_number: 'a',
                    description: 'description')
  end

  describe "GET show" do
    context "HTML" do
      context 'when it has a flat fee' do
        let!(:flat_fee) do
          BandedFee.where(fee_type_id: fee.id).delete_all
          FlatFee.create!(fee_type_id: fee.id,
                          fee_number: '1.4 a',
                          amount: '35')
        end

        before do
          fee.banded_fees.delete unless fee.banded_fees.blank?
          get :show, id: fee.friendly_id, format: :html
        end

        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end

        it 'should have a flat fee' do
          expect(fee.flat_fee.blank?).to be false
          expect(fee.banded_fees.blank?).to be true
        end

        it 'shows the fee' do
          expect(response.body).to match '£35'
        end

        it "doesn't show the form for calculating the fee" do
          expect(response.body).not_to include 'Enter the sum claimed:'
        end
      end

      context 'when it has a banded fee' do
        let!(:banded_fee) do
          FlatFee.where(fee_type_id: fee.id).delete_all
          BandedFee.create!(fee_type_id: fee.id,
                            fee_number: '1.1',
                            from_amount: '0',
                            to_amount: '300',
                            amount: '35')
        end

        before do
          get :show, id: fee.friendly_id, format: :html
        end

        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end

        it 'should have a banded fee' do
          expect(fee.banded_fees.blank?).to be false
          expect(fee.flat_fee.blank?).to be true
        end

        it 'shows the form for calculating the fee' do
          expect(response.body).to match 'Enter the sum claimed:'
        end

        it "doesn't show the fee amount" do
          expect(response.body).not_to match '£35'
        end
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
    before(:each) do
      BandedFee.create!(fee_type_id: fee.id,
                        fee_number: '1.1',
                        from_amount: '0',
                        to_amount: '300',
                        amount: '35')
      get :amount, id: fee.friendly_id, amount: '100'
    end


    it 'should return successful status code' do
      expect(response.status).to eq 200
    end

    it 'should return the fee that is due' do
      expect(response.body).to match '35'
    end
  end
end
