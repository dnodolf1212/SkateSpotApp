class Skatespot < ApplicationRecord
  #belongs_to :user
  has_many :comments, through: :users 

  validates :name, presence: true 
  validates :location, presence: true 
  validates :category, presence: true

end
