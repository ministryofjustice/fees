class GeneralApplication < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  validates :title, presence: true
  validates :fee, presence: true

  def should_generate_new_friendly_id?
    title_changed?
  end
end
