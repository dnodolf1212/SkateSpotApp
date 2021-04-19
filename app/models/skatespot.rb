class Skatespot < ApplicationRecord
  has_many :comments
  #has_many :users
  has_many :users, through: :comments
  

  validates :name, presence: true 
  validates :location, presence: true 
  validates :category, presence: true

def self.search(search)
  if search
    skatespot = Skatespot.find_by(name: search)
      if skatespot
        self.where(name: skatespot)
      else
        @skatespot = Skatespot.all 
      end
  else
    @skatespot = Skatespot.all
  end
end
end