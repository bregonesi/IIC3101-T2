class News < ApplicationRecord
	belongs_to :author, foreign_key: "user_id", class_name: "User"

	# Validates
  validates :author, presence: true
  validates :headline, presence: true
  validates :subhead, presence: true
  validates :copy, presence: true
end
