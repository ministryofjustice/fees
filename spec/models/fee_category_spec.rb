require 'rails_helper'

RSpec.describe FeeCategory, :type => :model do
  context 'validations' do
    context 'with the title' do
      let(:category) { FeeCategory.new(title: 'some category') }

      it 'should be valid' do
        expect(category).to be_valid
      end
    end

    context 'without the title' do
      it 'should not be valid' do
        expect(FeeCategory.new).to_not be_valid
      end
    end
  end
end
