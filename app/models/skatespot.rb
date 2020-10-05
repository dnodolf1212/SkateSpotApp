class Skatespot < ApplicationRecord
  has_many :comments
  has_many :users
  

  validates :name, presence: true 
  validates :location, presence: true 
  

end
 