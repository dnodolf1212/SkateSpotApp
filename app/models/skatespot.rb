class Skatespot < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  

  validates :name, presence: true 
  validates :location, presence: true 
  validates :category, presence: true

  
end