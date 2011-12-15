class Advising < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    advice_date    :date
    contact_type   :string
    advice_type    :string
    advice_content :string
    timestamps
  end

	# --- Relations --- #
	belongs_to :member

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
