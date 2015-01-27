class GeneralApplication < ActiveRecord::Base
  validates :title, presence: true
  validates :fee, presence: true
end
