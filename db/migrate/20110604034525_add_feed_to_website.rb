class AddFeedToWebsite < ActiveRecord::Migration
  def self.up
    add_column :websites, :feed_id, :integer
  end

  def self.down
    remove_column :websites, :feed_id
  end
end
