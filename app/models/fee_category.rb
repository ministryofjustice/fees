class FeeCategory < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :fee_types

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
