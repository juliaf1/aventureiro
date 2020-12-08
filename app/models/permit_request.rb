class PermitRequest < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, confirmed: 1, rejected: 2 }

  validates :arrival, :departure, :first_name, :last_name, :email, presence: true
end
