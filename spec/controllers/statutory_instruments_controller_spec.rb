require 'rails_helper'

RSpec.describe StatutoryInstrumentsController, :type => :controller do
  render_views

  describe "GET index" do
    before(:all) do
      StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                  description: '',
                                  coming_into_force: '2014-04-01')
    end

    context "HTML" do
      it "should render the list of fee categories in HTML" do
        get :index, format: :html
        expect(response.status).to eq(200)
      end

      it "should list fee categories in HTML" do
        get :index, format: :html
        expect(response.body).to match /The\ Civil\ Proceedings\ Fees\ \(Amendment\)\ Order\ 2014/
      end
    end

    context "JSON" do
      let(:json) do
        [{
           "title" => "The Civil Proceedings Fees (Amendment) Order 2014",
           "coming_into_force" => "2014-04-01",
           "link" => "the-civil-proceedings-fees-amendment-order-2014"
         }].to_json
      end

      it "should render the list of fee categories in JSON" do
        get :index, format: :json
        expect(response.status).to eq(200)
      end

      it "should list the statutory instruments in JSON" do
        get :index, format: :json
        expect(response.body).to eq json
      end
    end
  end

  describe "GET show" do
    let(:si) do
      StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                  description: '',
                                  coming_into_force: '2014-04-01')
    end

    context "HTML" do
      it "should render a statutory instrument in HTML" do
        get :show, id: si.id, format: :html
        expect(response.status).to eq(200)
      end

      it "should show the statutory instrument" do
        get :show, id: si.id, format: :html
        expect(response.body).to include 'The Civil Proceedings Fees (Amendment) Order 2014'
      end

      context 'when there are Fee Categories present' do
        let(:category) do
          FeeCategory.create!(title: 'Starting proceedings (High Court and Court)',
                              statutory_instrument_id: si.id,
                              description: 'description',
                              fee_number: '1.1')
        end

        it 'should show the Fee Categories' do
          get :show, id: si.id, format: :html
          expect(response.body).to include category.title
        end
      end
    end

    context "JSON" do
      it "should render a statutory instrument in JSON" do
        get :show, id: si.id, format: :json
        expect(response.status).to eq(200)
      end

      it "should render a statutory instrument in JSON" do
        get :show, id: si.id, format: :json
        expect(response.body).to include 'The Civil Proceedings Fees (Amendment) Order 2014'
      end
    end
  end
end
