class HoboMigration21 < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.string   :concept
      t.decimal  :price, :precision => 8, :scale => 2, :default => 0
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :activity_id
    end
    add_index :expenses, [:activity_id]
  end

  def self.down
    drop_table :expenses
  end
end
