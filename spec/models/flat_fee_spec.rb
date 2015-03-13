require 'rails_helper'

RSpec.describe FlatFee, type: :model do
  context 'validations' do
    let!(:fee) do
      FlatFee.new(fee_id: 1,
                  fee_number: '1.1',
                  amount: '35')
    end

    subject { fee.valid? }

    it { is_expected.to be true }

    describe 'fee_number attribute' do
      before { fee.fee_number = '' }

      it { is_expected.to_not be true }
    end

    describe 'amount attribute' do
      before { fee.amount = '' }

      it { is_expected.to_not be true }
    end
  end
end
