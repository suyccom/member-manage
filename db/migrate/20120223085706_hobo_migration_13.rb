class HoboMigration13 < ActiveRecord::Migration
  def self.up
    add_column :advisings, :contact_type, :string
  end

  def self.down
    remove_column :advisings, :contact_type
  end
end
