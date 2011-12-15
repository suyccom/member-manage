class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :member_actions do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :member_id
      t.integer  :action_id
    end
    add_index :member_actions, [:member_id]
    add_index :member_actions, [:action_id]

    add_column :advisings, :member_id, :integer

    add_index :advisings, [:member_id]
  end

  def self.down
    remove_column :advisings, :member_id

    drop_table :member_actions

    remove_index :advisings, :name => :index_advisings_on_member_id rescue ActiveRecord::StatementInvalid
  end
end
