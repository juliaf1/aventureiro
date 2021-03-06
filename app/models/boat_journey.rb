class BoatJourney < ApplicationRecord
  belongs_to :boat
  has_many :boat_journey_reservations, dependent: :destroy
  validates :departure_time, :travel_duration, :price_person, presence: true
end
