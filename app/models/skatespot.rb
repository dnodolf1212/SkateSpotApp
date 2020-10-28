class Skatespot < ApplicationRecord
  has_many :comments
  #has_many :users
  has_many :users, through: :comments
  

  validates :name, presence: true 
  validates :location, presence: true 
  validates :category, presence: true

  def self.search_by_name(query)
    self.where("name like ?", "%#{query}%")
  end
end
 