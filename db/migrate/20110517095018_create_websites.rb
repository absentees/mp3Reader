class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.string :name
      t.string :url
      t.string :feedUrl

      t.timestamps
    end
  end

  def self.down
    drop_table :websites
  end
end
