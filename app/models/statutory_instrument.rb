class StatutoryInstrument < ActiveRecord::Base
  validates :title, :coming_into_force, presence: true
end
