class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :task_id
  belongs_to :task
  belongs_to :user
  
  validates :name, :presence => { :message => "You must be logged in to comment on a task" }
end
