class HoboMigration15 < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :company_id
    end
    add_index :projects, [:company_id]

    create_table :companies do |t|
      t.string   :name
      t.string   :address
      t.string   :postal_code
      t.string   :location
      t.string   :province
      t.string   :contact_person
      t.string   :website
      t.string   :phone
      t.string   :mobile
      t.string   :email
      t.string   :company_type
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :projects
    drop_table :companies
  end
end
