class Comment < ApplicationRecord 
  belongs_to :skatespot 
  belongs_to :user
  #has_many :users, through: :skatespots

  validates :content, presence: true  
  validates :status, presence: true

  def self.find_by_skatespot_id(id) 
    self.where(skatespot_id: id)
  end

  def self.last_first 
    self.order(created_at: :desc)
  end

end
 