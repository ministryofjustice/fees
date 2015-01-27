require 'rails_helper'

RSpec.describe GeneralApplicationsController, :type => :controller do

  describe "#index" do
    it "should render the index of general applications" do
      get :index
      expect(response.status).to eq(200)
    end
  end

end
