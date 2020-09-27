class Skatespot < ApplicationRecord
  has_many :comments
  has_many :comments, through: :users 

  validates :name, presence: true 
  validates :location, presence: true 
  validates :category, presence: true

end
 