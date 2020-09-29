class Comment < ApplicationRecord
  belongs_to :skatespot 
  belongs_to :user
end
