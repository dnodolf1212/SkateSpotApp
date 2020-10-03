class Comment < ApplicationRecord
  belongs_to :skatespot 
  belongs_to :user
 
  def self.find_by_skatespot_id(id) 
    self.where(skatespot_id: id)
  end

end
