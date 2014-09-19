class Feed < ActiveRecord::Base
  attr_accessible :atype, :user_id, :key, :task_id, :comment_id, :project_id
  belongs_to :user
  belongs_to :task
  belongs_to :project
  belongs_to :comment
  
end
