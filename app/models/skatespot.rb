class Skatespot < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments 
  accepts_nested_attributes_for :comments

  validates :name, presence: true 
  validates :location, presence: true 

  def comment_attributes=(comment_attributes)
    @comment = Comment.find_or_create_by(comment_attributes)
    self.comment = @comment
    save 
  end
  

end
 