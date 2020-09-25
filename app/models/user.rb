class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true 

  has_many :skatespots 
  has_many :comments
  has_many :skatespots, through: :comments

end 
