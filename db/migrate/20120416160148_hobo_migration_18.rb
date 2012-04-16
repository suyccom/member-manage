class HoboMigration18 < ActiveRecord::Migration
  def self.up
    add_column :advisings, :contact_data, :text
  end

  def self.down
    remove_column :advisings, :contact_data
  end
end
