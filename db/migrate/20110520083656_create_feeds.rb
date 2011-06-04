class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.integer :website_id
      t.integer :user_id

      t.timestamps
    end
    add_index :feeds, :user_id, :unique => true
  end

  def self.down
    drop_table :feeds
  end
end
