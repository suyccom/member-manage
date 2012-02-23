class Advising < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    advice_date    :date
    advice_content :text
    timestamps
  end

	# --- Relations --- #
	belongs_to :advice_type

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
