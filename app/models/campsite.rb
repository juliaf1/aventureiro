class Campsite < ApplicationRecord
  belongs_to :user

  validates: :daily_price, :name, :description, presence: true
end
