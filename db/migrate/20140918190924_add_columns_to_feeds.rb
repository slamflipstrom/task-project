class AddColumnsToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :task_id, :integer
    add_column :feeds, :comment_id, :integer
    add_column :feeds, :project_id, :integer
  end
end
