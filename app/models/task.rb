class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id, :category_id
  belongs_to :category
  belongs_to :project
  acts_as_list
  scope :default_order, order("position")
  
  validates :title, :presence => true
end
