class Comment < ActiveRecord::Base
  attr_accessible :body, :name
  belongs_to :task
  
  validates :name, :presence => { :message => "You must be logged in to comment on a task" }
end
