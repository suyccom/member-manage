class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string   :name
      t.string   :surname
      t.string   :address
      t.string   :id_card
      t.date     :birth_date
      t.string   :gender
      t.string   :phone
      t.string   :mobile
      t.string   :email
      t.date     :member_since
      t.boolean  :member
      t.boolean  :disability
      t.integer  :disability_percent
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :members
  end
end
