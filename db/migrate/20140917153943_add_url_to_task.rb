class AddUrlToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :url, :text
    # Task.initialize_urls
  end
end
