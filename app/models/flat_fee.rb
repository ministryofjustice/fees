class FlatFee < ActiveRecord::Base
  belongs_to :fee

  validates :fee_number, :amount, presence: true
end
