class HoboMigration16 < ActiveRecord::Migration
  def self.up
    create_table :audiometries do |t|
      t.date     :audiometry_date
      t.string   :audiometry_center
      t.integer  :re500
      t.integer  :re1000
      t.integer  :re2000
      t.integer  :re3000
      t.integer  :le500
      t.integer  :le1000
      t.integer  :le2000
      t.integer  :le3000
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :member_id
    end
    add_index :audiometries, [:member_id]
  end

  def self.down
    drop_table :audiometries
  end
end
