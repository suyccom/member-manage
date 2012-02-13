class HoboMigration8 < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.date     :date
      t.string   :title
      t.string   :activity_type
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :member_activities do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :member_id
      t.integer  :activity_id
    end
    add_index :member_activities, [:member_id]
    add_index :member_activities, [:activity_id]

    add_column :actions, :activity_type, :string
  end

  def self.down
    remove_column :actions, :activity_type

    drop_table :activities
    drop_table :member_activities
  end
end
