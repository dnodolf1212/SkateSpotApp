class User < ApplicationRecord
  has_secure_password
  
  has_many :skatespots 
  has_many :comments
  has_many :skatespots, through: :comments

  validates :name, uniqueness: true 

  def self.find_or_create_by_facebook(auth) 
    find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex(15)
    end
  end
end 
