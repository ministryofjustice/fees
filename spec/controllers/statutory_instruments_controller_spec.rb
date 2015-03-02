require 'rails_helper'

RSpec.describe StatutoryInstrumentsController, :type => :controller do
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
  end

  describe "GET show" do
    let(:si) do
      StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                  description: '',
                                  coming_into_force: '2014-04-01')
    end

    context "HTML" do
      it "should render a fee category in HTML" do
        get :show, id: si.id, format: :html
        expect(response.status).to eq(200)
      end
    end

    context "JSON" do
      it "should render a fee category in JSON" do
        get :show, id: si.id, format: :json
        expect(response.status).to eq(200)
      end
    end
  end
end
