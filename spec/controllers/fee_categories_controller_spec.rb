require 'rails_helper'

RSpec.describe FeeCategoriesController, :type => :controller do
  render_views

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
    let(:fee) { FeeCategory.create!(title: 'General Applications') }

    it "should render a fee category in HTML" do
      get :show, id: fee.friendly_id, format: :html
      expect(response.status).to eq(200)
    end

    it "should render a fee category in JSON" do
      get :show, id: fee.friendly_id, format: :json
      expect(response.status).to eq(200)
    end
  end
end
