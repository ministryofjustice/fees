class BandedFee < ActiveRecord::Base
  belongs_to :fee

  validates :fee_number,
            :from_amount,
            :to_amount,
            :amount, presence: true
end
