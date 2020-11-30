class Boat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :max_occupation, presence: true
end
