class Activity < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    date  :date
    title :string
    timestamps
  end

  # --- Relations --- #
  has_many :members, :through => :member_activities, :accessible => true
  has_many :member_activities, :dependent => :destroy
  belongs_to :activity_type

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end