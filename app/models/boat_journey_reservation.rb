class BoatJourneyReservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat_journey
  enum status: { pending: 0, confirmed: 1, rejected: 2 }
  validates :number_passengers, :total_price, presence: true
end
