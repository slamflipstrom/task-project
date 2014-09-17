class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id, :category_id
  belongs_to :category
  belongs_to :project
  has_many :comments
  
  validates :title, :presence => true
end
