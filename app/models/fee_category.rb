class FeeCategory < ActiveRecord::Base
  validates :title, :description, :fee_number, presence: true
  has_many :fees

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
