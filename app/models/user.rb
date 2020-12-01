class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :boats
  has_many :boat_journeys, through: :boats

  has_many :boat_journey_reservations
  has_many :campsite_reservations

  has_many :campsites
  has_many :campsite_reservations, through: :campsites

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
end
