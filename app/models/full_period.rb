class FullPeriod < ApplicationRecord
  belongs_to :campsite

  validates :start_date, :end_date, presence: true
end
