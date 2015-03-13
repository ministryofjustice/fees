require 'rails_helper'

RSpec.describe Fee, type: :model do
  context 'validations' do
    let(:fee) do
      Fee.new(title: 'some fee',
              fee_number: 'a',
              description: 'description')
    end

    subject { fee.valid? }

    it { is_expected.to be true }


    describe 'without the title' do
      before { fee.title = '' }

      it { is_expected.to_not be true }
    end

    describe 'without the fee_number' do
      before { fee.fee_number = '' }

      it { is_expected.to_not be true }
    end

    describe 'without the description' do
      before { fee.description = '' }

      it { is_expected.to_not be true }
    end
  end

  context "create nested fees under FeeCategory" do
    it 'should work' do
      expect(Fee.reflect_on_association(:fee_category).macro).to eq(:belongs_to)
    end
  end

  describe 'slug re-generation' do
    let(:fee) do
      category = FeeCategory.create!(title: 'foo',
                                     statutory_instrument_id: 1,
                                     description: 'description',
                                     fee_number: '1')
      fee = Fee.create!(title: 'foo',
                        fee_category_id: category.id,
                        fee_number: 'a',
                        description: 'description')
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
      Fee.create!(title: 'foo',
                  fee_category_id: category.id,
                  fee_number: 'a',
                  description: 'description')
    end

    before do
      bands = [['a', '0', '300', '35'],
               ['b', '300', '500', '50'],
               ['c', '500', '1000', '70'],
               ['d', '1000', '1500', '80'],
               ['e', '1500', '3000', '115'],
               ['f', '3000', '5000', '205'],
               ['g', '5000', '15000', '455'],
               ['h', '15000', '50000', '610'],
               ['i', '50000', '100000', '910'],
               ['j', '100000', '150000', '1115'],
               ['k', '150000', '200000', '1350'],
               ['l', '200000', '250000', '1515'],
               ['m', '250000', '300000', '1720'],
               ['n', '300000', 'unlimited', '1920']]

      bands.each do |band|
        BandedFee.create!(fee_id: fee.id,
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

    it 'should handle the "unlimited" upper fee limit correctly' do
      expect(fee.get_band('300001').amount).to match '1920'
    end

    it 'should handle correctly the amounts that match the upper limit of a band' do
      expect(fee.get_band('3000').amount).to match '115'
    end

    it 'should handle the decimal amounts correctly' do
      expect(fee.get_band('3000.27').amount).to match '205'
    end
  end
end