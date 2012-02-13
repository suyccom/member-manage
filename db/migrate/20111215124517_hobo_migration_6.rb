class HoboMigration6 < ActiveRecord::Migration
  def self.up
    rename_column :actions, :action_title, :title
  end

  def self.down
    rename_column :actions, :title, :action_title
  end
end
