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

  context "create nested fees under FeeCategory" do
    it 'should work' do
      expect(FeeType.reflect_on_association(:fee_category).macro).to eq(:belongs_to)
    end
  end

  describe 'slug re-generation' do
    let(:fee) do
      category = FeeCategory.create!(title: 'foo',
                                     statutory_instrument_id: 1,
                                     description: 'description',
                                     fee_number: '1')
      fee = FeeType.create!(title: 'foo', amount: 10, fee_category_id: category.id)
      fee.update(title: 'foo bar')
      fee
    end

    it 'should change the slug to match the new title' do
      expect(fee.slug).to match 'foo-bar'
    end
  end
end
