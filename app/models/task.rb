class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id
  belongs_to :category
  
  validates :title, :presence => true
end
