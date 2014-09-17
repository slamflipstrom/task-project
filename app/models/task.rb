class Task < ActiveRecord::Base
  attr_accessible :description, :done, :title, :user_id, :category_id
  belongs_to :category
  belongs_to :project
  
  acts_as_url :title
  
  validates :title, :presence => true
  
  
  
  

 
  
  
  def to_param
 url
  end
  
end


