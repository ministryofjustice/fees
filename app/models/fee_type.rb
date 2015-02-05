class FeeType < ActiveRecord::Base
  belongs_to :fee_category

  validates :title, :amount, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
