class FeeCategory < ActiveRecord::Base
  validates :title, presence: true
end
