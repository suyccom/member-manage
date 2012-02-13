class HoboMigration9 < ActiveRecord::Migration
  def self.up
    drop_table :member_actions
    drop_table :actions
  end

  def self.down
    create_table "member_actions", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "member_id"
      t.integer  "action_id"
    end

    add_index "member_actions", ["action_id"], :name => "index_member_actions_on_action_id"
    add_index "member_actions", ["member_id"], :name => "index_member_actions_on_member_id"

    create_table "actions", :force => true do |t|
      t.date     "date"
      t.string   "title"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "activity_type"
    end
  end
end
