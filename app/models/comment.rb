class Comment < ApplicationRecord 
  belongs_to :skatespot 

  validates :content, presence: true  
  validates :status, presence: true

  def self.find_by_skatespot_id(id) 
    self.where(skatespot_id: id)
  end

end
