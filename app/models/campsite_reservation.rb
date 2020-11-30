class CampsiteReservation < ApplicationRecord
  belongs_to :user
  belongs_to :campsite
end
