class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id, :category_id
  belongs_to :category
  belongs_to :project
  has_many :comments
  belongs_to :user
  acts_as_list
  scope :default_order, order("position")
  acts_as_url :title
  
  validates :title, :presence => true
  
  
  
  

 
  
  
  def to_param
    url
  end
  
end


