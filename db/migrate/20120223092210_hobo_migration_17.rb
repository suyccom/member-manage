class HoboMigration17 < ActiveRecord::Migration
  def self.up
    add_column :advisings, :member_id, :integer
    add_column :advisings, :company_id, :integer

    add_index :advisings, [:member_id]
    add_index :advisings, [:company_id]
  end

  def self.down
    remove_column :advisings, :member_id
    remove_column :advisings, :company_id

    remove_index :advisings, :name => :index_advisings_on_member_id rescue ActiveRecord::StatementInvalid
    remove_index :advisings, :name => :index_advisings_on_company_id rescue ActiveRecord::StatementInvalid
  end
end
