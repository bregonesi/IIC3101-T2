class News < ApplicationRecord
	belongs_to :author, foreign_key: "user_id", class_name: "User"

	# Validates
  validates :author, presence: true
  validates :headline, presence: true
  validates :subhead, presence: true
  validates :copy, presence: true

  # Shorts
  def short_headline(len = 200)
  	self.headline.truncate(len)
  end
  def short_subhead(len = 200)
  	self.subhead.truncate(len)
  end
  def short_copy(len = 500)
  	self.copy.truncate(len)
  end
end
