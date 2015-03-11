require 'rails_helper'

RSpec.describe FeeType, :type => :model do
  context 'validations' do
    context 'with all the attributes' do
      let(:fee) do
        FeeType.new(title: 'some fee',
                    amount: 100,
                    fee_number: 'a')
      end

      it 'should be valid' do
        expect(fee).to be_valid
      end
    end

    context 'without the title' do
      it 'should not be valid' do
        expect(FeeType.new).to_not be_valid
      end
    end

    context 'without the fee_number' do
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
      fee = FeeType.create!(title: 'foo',
                            amount: 10,
                            fee_category_id: category.id,
                            fee_number: 'a')
      fee.update(title: 'foo bar')
      fee
    end

    it 'should change the slug to match the new title' do
      expect(fee.slug).to match 'foo-bar'
    end
  end

  describe '.get_band' do
    let(:category) do
      FeeCategory.create!(title: 'foo',
                          statutory_instrument_id: 1,
                          description: 'description',
                          fee_number: '1')
    end

    let!(:fee) do
      FeeType.create!(title: 'foo',
                      amount: 10,
                      fee_category_id: category.id,
                      fee_number: 'a')
    end

    before do
      bands = [['a', '0', '300', '35'],
               ['b', '300', '500', '50'],
               ['c', '500', '1000', '70'],
               ['d', '1000', '1500', '80'],
               ['e', '1500', '3000', '115'],
               ['f', '3000', '5000', '205']]

      bands.each do |band|
        BandedFee.create!(fee_type_id: fee.id,
                          fee_number: band[0],
                          from_amount: band[1],
                          to_amount: band[2],
                          amount: band[3])
      end
      fee.reload
    end

    it 'should return the fee band based on the amount given' do
      expect(fee.get_band('200').amount).to match '35'
    end
  end
end
