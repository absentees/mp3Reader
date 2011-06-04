class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :website_id
      t.string :url
      t.string :fileType

      t.timestamps
    end
    add_index :links, :website_id
    add_index :links, :url, :unique => true
  end

  def self.down
    drop_table :links
  end
end
