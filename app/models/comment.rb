class Comment < ApplicationRecord
  belongs_to :skatespots 
  belongs_to :users
  
end
