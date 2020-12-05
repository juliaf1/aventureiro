class Campsite < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :full_periods

  validates :daily_price, :name, :description, presence: true
end
