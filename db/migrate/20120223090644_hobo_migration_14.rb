class HoboMigration14 < ActiveRecord::Migration
  def self.up
    add_column :members, :hearing_aid, :boolean
    add_column :members, :hearing_aid_type, :string
    add_column :members, :hearing_aid_center, :string
    add_column :members, :diagnosis, :text
    remove_column :members, :member_since
  end

  def self.down
    remove_column :members, :hearing_aid
    remove_column :members, :hearing_aid_type
    remove_column :members, :hearing_aid_center
    remove_column :members, :diagnosis
    add_column :members, :member_since, :date
  end
end
