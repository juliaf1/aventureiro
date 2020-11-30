class Boat < ApplicationRecord
  belongs_to :user

  validates :name, :max_occupation, presence: true
end
