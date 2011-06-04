class RemoveUserFromWebsites < ActiveRecord::Migration
  def self.up
    remove_column :websites, :user_id
  end

  def self.down
    add_column :websites, :user_id, :string
  end
end
