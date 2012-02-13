class HoboMigration10 < ActiveRecord::Migration
  def self.up
    create_table :activity_types do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :activities, :activity_type_id, :integer
    remove_column :activities, :activity_type

    add_index :activities, [:activity_type_id]
  end

  def self.down
    remove_column :activities, :activity_type_id
    add_column :activities, :activity_type, :string

    drop_table :activity_types

    remove_index :activities, :name => :index_activities_on_activity_type_id rescue ActiveRecord::StatementInvalid
  end
end
