class StatutoryInstrument < ActiveRecord::Base
  validates :title, :coming_into_force, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
