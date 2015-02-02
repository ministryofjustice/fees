require 'rails_helper'

RSpec.describe FeeCategoriesController, :type => :controller do
  render_views

  describe "#index" do
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

      it "should list fee categories in HTML" do
        get :index, format: :html
        expect(response.body).to match /(General\ Applications|Money\ Claims)/im
      end
    end
  end
end
