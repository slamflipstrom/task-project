class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :categories
  
  has_secure_password 
end
