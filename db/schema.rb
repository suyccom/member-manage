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

ActiveRecord::Schema.define(:version => 20121019101827) do

  create_table "activities", :force => true do |t|
    t.date     "start_date"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_type_id"
    t.date     "end_date"
    t.text     "content"
    t.decimal  "money",            :precision => 8, :scale => 2, :default => 0.0
  end

  add_index "activities", ["activity_type_id"], :name => "index_activities_on_activity_type_id"

  create_table "activity_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advice_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advisings", :force => true do |t|
    t.date     "advice_date"
    t.text     "advice_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "advice_type_id"
    t.string   "contact_type"
    t.integer  "member_id"
    t.integer  "company_id"
    t.text     "contact_data"
  end

  add_index "advisings", ["advice_type_id"], :name => "index_advisings_on_advice_type_id"
  add_index "advisings", ["company_id"], :name => "index_advisings_on_company_id"
  add_index "advisings", ["member_id"], :name => "index_advisings_on_member_id"

  create_table "audiometries", :force => true do |t|
    t.date     "audiometry_date"
    t.string   "audiometry_center"
    t.integer  "re500"
    t.integer  "re1000"
    t.integer  "re2000"
    t.integer  "re3000"
    t.integer  "le500"
    t.integer  "le1000"
    t.integer  "le2000"
    t.integer  "le3000"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  add_index "audiometries", ["member_id"], :name => "index_audiometries_on_member_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postal_code"
    t.string   "location"
    t.string   "province"
    t.string   "contact_person"
    t.string   "website"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "company_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_activities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "activity_id"
  end

  add_index "member_activities", ["activity_id"], :name => "index_member_activities_on_activity_id"
  add_index "member_activities", ["member_id"], :name => "index_member_activities_on_member_id"

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
    t.boolean  "member"
    t.boolean  "disability"
    t.integer  "disability_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postal_code"
    t.string   "location"
    t.string   "province"
    t.boolean  "hearing_aid"
    t.string   "hearing_aid_type"
    t.string   "hearing_aid_center"
    t.text     "diagnosis"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "projects", ["company_id"], :name => "index_projects_on_company_id"

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
