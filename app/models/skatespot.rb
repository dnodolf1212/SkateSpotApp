class Skatespot < ApplicationRecord
  has_many :comments

  validates :name, presence: true 
  validates :location, presence: true 
  

end
 