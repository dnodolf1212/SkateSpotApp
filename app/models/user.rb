class User < ApplicationRecord
  has_many :skatespots 
  has_many :comments
  
end
