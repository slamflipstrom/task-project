class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :task_id, :user_id
end
