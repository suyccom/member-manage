class Advising < ActiveRecord::Base

  hobo_model # Don't put anything above this

  Contacttype = HoboFields::Types::EnumString.for(:user,:company,:contact)

  fields do
    advice_date    :date
    advice_content :text
    contact_type   Contacttype
    timestamps
  end

	# --- Relations --- #
	belongs_to :advice_type
	belongs_to :member
	belongs_to :company

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
