class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.date     :action_date
      t.string   :action_title
      t.string   :action_type
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :actions
  end
end
