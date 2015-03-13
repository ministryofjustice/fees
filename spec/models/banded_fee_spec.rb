require 'rails_helper'

RSpec.describe BandedFee, type: :model do
  context 'validations' do
    let!(:fee) do
      BandedFee.new(fee_id: 1,
                    fee_number: '1.1',
                    from_amount: '0',
                    to_amount: '300',
                    amount: '35')
    end

    subject { fee.valid? }

    it { is_expected.to be true }

    describe 'fee_number attribute' do
      before { fee.fee_number = '' }

      it { is_expected.to_not be true }
    end

    describe 'from_amount attribute' do
      before { fee.from_amount = '' }

      it { is_expected.to_not be true }
    end

    describe 'to_amount attribute' do
      before { fee.to_amount = '' }

      it { is_expected.to_not be true }
    end

    describe 'amount attribute' do
      before { fee.amount = '' }

      it { is_expected.to_not be true }
    end
  end
end
