require 'rails_helper'

RSpec.describe GeneralApplicationsController, :type => :controller do

  describe "#index" do
    it "should render the index of general applications" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    before do
      GeneralApplication.new(title: 'application1', fee: '1')
    end

    it 'should render the show view' do
      get :show, format: :json, id: 'application1'
      expect(response.status).to eq(200)
    end
  end

end
