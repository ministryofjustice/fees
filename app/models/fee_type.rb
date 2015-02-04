class FeeType < ActiveRecord::Base
  belongs_to :fee_category

  validates :title, :amount, presence: true
end
