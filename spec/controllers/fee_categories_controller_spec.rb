require 'rails_helper'

RSpec.describe FeeCategoriesController, :type => :controller do
  render_views

  describe "search link" do
    it "should show the search link for fees" do
      get :index, format: :html
      expect(response.body).to include "Fee search"
    end
  end

  describe "GET index" do
    it "should render the list of fee categories in HTML" do
      get :index, format: :html
      expect(response.status).to eq(200)
    end

    it "should render the list of fee categories in JSON" do
      get :index, format: :json
      expect(response.status).to eq(200)
    end

    context "when there are multiple categories" do
      before do
        ['General Applications',
         'Money Claims'].each do |category|
          FeeCategory.create!(title: category)
        end
      end

      context "HTML" do
        it "should list fee categories in HTML" do
          get :index, format: :html
          expect(response.body).to match /(General\ Applications|Money\ Claims)/im
          expect(response.body).to match /(general-applications|money-claims)/im
        end
      end

      context "JSON" do
        let(:json) do
          [
            { "title" => "General Applications", "link" => "general-applications" },
            { "title" => "Money Claims", "link" => "money-claims" }
          ].to_json
        end

        it "should list fee categories in JSON" do
          get :index, format: :json
          expect(response.body).to match json
        end
      end
    end
  end

  describe "GET show" do
    let(:category) { FeeCategory.create!(title: 'General Applications') }
    let!(:fee) do
      FeeType.create!(fee_category_id: category.id,
                      title: 'yes yes',
                      amount: 10)
    end

    context "HTML" do
      it "should render a fee category in HTML" do
        get :show, id: category.friendly_id, format: :html
        expect(response.status).to eq(200)
      end

      it "should show the fee category" do
        get :show, id: category.friendly_id, format: :html
        expect(response.body).to match 'General Applications'
      end

      it "should show the fee types under the category" do
        get :show, id: category.friendly_id, format: :html
        expect(response.body).to match 'yes yes'
      end

      it "should show the url link" do
        get :show, id: category.friendly_id, format: :html
        expect(response.body).to match /yes-yes/
      end
    end

    context "JSON" do
      it "should render a fee category in JSON" do
        get :show, id: category.friendly_id, format: :json
        expect(response.status).to eq(200)
      end

      it "should show the fee category" do
        get :show, id: category.friendly_id, format: :json
        expect(response.body).to match 'General Applications'
      end

      it "should show the fee types under the category" do
        get :show, id: category.friendly_id, format: :json
        expect(response.body).to match 'yes yes'
      end
    end
  end
end
