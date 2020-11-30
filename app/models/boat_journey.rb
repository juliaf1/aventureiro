class BoatJourney < ApplicationRecord
  belongs_to :boat

  validates: :departure_time, :travel_duration, :price_person, presence: true
end
