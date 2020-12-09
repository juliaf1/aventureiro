class CampsiteReservation < ApplicationRecord
  belongs_to :user
  belongs_to :campsite
  enum status: { pending: 0, confirmed: 1, rejected: 2 }
  validates :check_in, :check_out, :description, :number_guests, presence: true
  validates :description, length: { minimum: 30 }
  validates_uniqueness_of :check_in, scope: :user_id

  before_save :set_total_price

  def set_total_price
    return false unless check_in && check_out && number_guests
    daily_price = number_guests * campsite.daily_price
    self.total_price = daily_price * (check_out - check_in + 1).to_i
  end
end
