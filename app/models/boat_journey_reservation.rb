class BoatJourneyReservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat_journey
  enum status: { pending: 0, confirmed: 1, rejected: 2 }
  validates :number_passengers, presence: true

  before_save :set_total_price

  def set_total_price
    self.total_price = number_passengers * boat_journey.price_person
  end
end
