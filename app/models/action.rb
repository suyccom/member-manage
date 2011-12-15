class Action < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    action_date  :date
    title :string
#    action_type  :string
    timestamps
  end

  # --- Relations --- #
  has_many :members, :through => :member_actions, :accessible => true
  has_many :member_actions, :dependent => :destroy

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
