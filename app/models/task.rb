class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id, :category_id
  belongs_to :category
  belongs_to :project
  belongs_to :user
  
  validates :title, :presence => true
end
