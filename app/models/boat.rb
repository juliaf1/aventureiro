class Boat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :boat_journeys, dependent: :destroy

  validates :name, :max_occupation, presence: true
end
