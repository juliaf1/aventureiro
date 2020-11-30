class BoatJourneyReservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat_journey
end
