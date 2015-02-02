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

  describe 'slug generation' do
    before { FeeCategory.create!(title: 'general') }

    let(:fee) { FeeCategory.where(title: 'general').first }
    let(:friendly_fee) { FeeCategory.friendly.find('general') }

    it 'should find the general application based on the slug id' do
      expect(fee).to eq friendly_fee
    end
  end
end
