require 'rails_helper'

RSpec.describe GeneralApplication, :type => :model do

  before(:each) { application.valid? }

  describe 'correct general application' do
    let(:application) do
      GeneralApplication.new(title: 'application1',
                             fee: '1')
    end

    it 'should be valid' do
      expect(application).to be_valid
    end
  end

  describe '#title' do
    context 'when only the title is present' do
      let(:application) { GeneralApplication.new(title: 'application1') }

      it 'should not be valid' do
        expect(application).to_not be_valid
      end
    end
  end

  describe '#fee' do
    context 'when only the fee is present' do
      let(:application) { GeneralApplication.new(fee: '1') }

      it 'should not be valid' do
        expect(application).to_not be_valid
      end
    end
  end
end
