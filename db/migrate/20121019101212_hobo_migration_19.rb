class HoboMigration19 < ActiveRecord::Migration
  def self.up
    add_column :activities, :content, :text
  end

  def self.down
    remove_column :activities, :content
  end
end
