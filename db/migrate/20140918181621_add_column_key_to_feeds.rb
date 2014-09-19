class AddColumnKeyToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :key, :string
  end
end
