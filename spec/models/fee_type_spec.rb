require 'rails_helper'

RSpec.describe FeeType, :type => :model do
  context 'validations' do
    context 'with the title and amount' do
      let(:fee) { FeeType.new(title: 'some fee', amount: 100) }

      it 'should be valid' do
        expect(fee).to be_valid
      end
    end

    context 'without the title' do
      it 'should not be valid' do
        expect(FeeType.new).to_not be_valid
      end
    end
  end
end
