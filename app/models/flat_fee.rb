class FlatFee < ActiveRecord::Base
  belongs_to :fee_type

  validates :fee_number, :amount, presence: true
end
