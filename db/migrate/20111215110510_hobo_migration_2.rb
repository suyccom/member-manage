class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :advisings do |t|
      t.date     :advice_date
      t.string   :contact_type
      t.string   :advice_type
      t.string   :advice_content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :advisings
  end
end
