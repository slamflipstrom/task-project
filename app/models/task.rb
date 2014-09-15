class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title
  
  validates :title, :presence => true
end
