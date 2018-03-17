class NewsComment < ApplicationRecord
  belongs_to :news

  # Validates
  validates :author, presence: true
  validates :comment, presence: true
end
