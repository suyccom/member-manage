class HoboMigration12 < ActiveRecord::Migration
  def self.up
    create_table :advice_types do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :advisings, :advice_type_id, :integer
    remove_column :advisings, :contact_type
    remove_column :advisings, :advice_type
    remove_column :advisings, :member_id
    change_column :advisings, :advice_content, :text, :limit => nil

    add_column :members, :postal_code, :string
    add_column :members, :location, :string
    add_column :members, :province, :string

    remove_index :advisings, :name => :index_advisings_on_member_id rescue ActiveRecord::StatementInvalid
    add_index :advisings, [:advice_type_id]
  end

  def self.down
    remove_column :advisings, :advice_type_id
    add_column :advisings, :contact_type, :string
    add_column :advisings, :advice_type, :string
    add_column :advisings, :member_id, :integer
    change_column :advisings, :advice_content, :string

    remove_column :members, :postal_code
    remove_column :members, :location
    remove_column :members, :province

    drop_table :advice_types

    remove_index :advisings, :name => :index_advisings_on_advice_type_id rescue ActiveRecord::StatementInvalid
    add_index :advisings, [:member_id]
  end
end
