class CampsiteReservation < ApplicationRecord
  belongs_to :user
  belongs_to :campsite

  validates: :check_in, :check_out, :description, :number_guests, presence: true
  validates: :description, length: { minimum: 30 }
end
