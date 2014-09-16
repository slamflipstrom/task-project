class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_and_belongs_to_many :projects
  has_many :tasks
  
  has_secure_password 
end
