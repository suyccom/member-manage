class Member < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name               :string
    surname            :string
    address            :string
    postal_code        :string
    location           :string
    province           :string
    id_card            :string
    birth_date         :date
    gender             enum_string(:male, :female)
    phone              :string
    mobile             :string
    email              :email_address
    member             :boolean
    disability         :boolean
    disability_percent :integer
    hearing_aid        :boolean
    hearing_aid_type   :string
    hearing_aid_center :string
    diagnosis          :text
    timestamps
  end

	# --- Relations --- #
	has_many :audiometries
	has_many :advisings
	children :audiometries, :advisings

	has_many :activities, :through => :member_activities
	has_many :member_activities, :dependent => :destroy

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
