class Campsite < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :daily_price, :name, :description, presence: true
end
