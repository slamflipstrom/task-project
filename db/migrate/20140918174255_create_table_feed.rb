class CreateTableFeed < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
          t.string :type
          t.integer :user_id
 
          t.timestamps
        end
  end
end
