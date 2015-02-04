class FeeCategory < ActiveRecord::Base
  validates :title, presence: true
  has_many :fee_types

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
end
