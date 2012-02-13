class HoboMigration7 < ActiveRecord::Migration
  def self.up
    rename_column :actions, :action_date, :date
  end

  def self.down
    rename_column :actions, :date, :action_date
  end
end
