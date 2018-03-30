class User < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #has_many :news, dependent: :destroy
end
