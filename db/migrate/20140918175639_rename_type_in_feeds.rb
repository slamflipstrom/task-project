class RenameTypeInFeeds < ActiveRecord::Migration
  def self.up
      rename_column :feeds, :type, :atype
  end
    
  def down
  end
end
