class CampsiteReservation < ApplicationRecord
  belongs_to :user
  belongs_to :campsite
  enum status: { pending: 0, confirmed: 1, rejected: 2 }
  validates :check_in, :check_out, :description, :number_guests, presence: true
  validates :description, length: { minimum: 30 }
end
