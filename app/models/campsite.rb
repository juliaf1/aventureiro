class Campsite < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates: :daily_price, :name, :description, presence: true
end
