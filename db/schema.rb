# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111215114956) do

  create_table "actions", :force => true do |t|
    t.date     "action_date"
    t.string   "action_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advisings", :force => true do |t|
    t.date     "advice_date"
    t.string   "contact_type"
    t.string   "advice_type"
    t.string   "advice_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  add_index "advisings", ["member_id"], :name => "index_advisings_on_member_id"

  create_table "member_actions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "action_id"
  end

  add_index "member_actions", ["action_id"], :name => "index_member_actions_on_action_id"
  add_index "member_actions", ["member_id"], :name => "index_member_actions_on_member_id"

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "id_card"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.date     "member_since"
    t.boolean  "member"
    t.boolean  "disability"
    t.integer  "disability_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "inactive"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
