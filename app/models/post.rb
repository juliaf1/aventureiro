class Post < ApplicationRecord
  has_rich_text :rich_body
  belongs_to :user
  has_one_attached :photo

  validates :rich_body, presence: true
end
