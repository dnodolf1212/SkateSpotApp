class Skatespot < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments 
  accepts_nested_attributes_for :comments

  validates :name, presence: true 
  validates :location, presence: true 
  

end
 