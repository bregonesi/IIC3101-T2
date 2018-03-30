class News < ApplicationRecord
	#belongs_to :author, foreign_key: "user_id", class_name: "User"
  has_many :comments, class_name: "NewsComment", dependent: :destroy

	# Validates
  # validates :author, presence: true
  validates :headline, presence: true
  validates_length_of :headline, :maximum => 200
  validates :subhead, presence: true
  validates_length_of :subhead, :maximum => 200
  validates :copy, presence: true

  # Shorts
  def short_headline(len = 200)
  	self.headline.truncate(len)
  end
  def short_copy(len = 500)
  	self.copy.truncate(len)
  end

end
