class BoatJourneyReservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat_journey

  validates: :number_passengers, :total_price, :status, presence: true
end
