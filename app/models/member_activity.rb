class MemberActivity < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end

	# --- Relations --- #
	belongs_to :member
	belongs_to :activity

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
