class FeeType < ActiveRecord::Base
  belongs_to :fee_category
  has_many :banded_fees
  has_one :flat_fee

  validates :title, :amount, :fee_number, :description, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end

  def get_band amount
    self.banded_fees.each do |band|
      return band if band.to_amount == 'unlimited'
      return band if band.to_amount.to_f >= amount.to_f
    end
  end
end
