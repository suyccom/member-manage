class HoboMigration5 < ActiveRecord::Migration
  def self.up
    remove_column :actions, :action_type
  end

  def self.down
    add_column :actions, :action_type, :string
  end
end
