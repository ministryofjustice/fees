require 'rails_helper'

RSpec.describe FeeCategoriesController, :type => :controller do

  describe "#index" do
    it "should render the list of fee categories in HTML" do
      get :index, format: :html
      expect(response.status).to eq(200)
    end

    it "should render the list of fee categories in JSON" do
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end

end
