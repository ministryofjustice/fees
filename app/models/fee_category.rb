class FeeCategory < ActiveRecord::Base
  validates :title, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
end
