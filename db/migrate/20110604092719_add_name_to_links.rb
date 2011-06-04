class AddNameToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :file_name, :string
  end

  def self.down
    remove_column :links, :file_name
  end
end
