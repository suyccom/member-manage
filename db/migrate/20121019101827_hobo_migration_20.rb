class HoboMigration20 < ActiveRecord::Migration
  def self.up
    add_column :activities, :money, :decimal, :precision => 8, :scale => 2, :default => 0
  end

  def self.down
    remove_column :activities, :money
  end
end
