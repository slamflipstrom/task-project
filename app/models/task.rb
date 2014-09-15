class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id
  
  validates :title, :presence => true
end
