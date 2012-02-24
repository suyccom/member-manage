class Member < ActiveRecord::Base

  hobo_model # Don't put anything above this

  Gender = HoboFields::Types::EnumString.for(:male, :female)

  fields do
    name               :string
    surname            :string
    address            :string
    postal_code        :string
    location           :string
    province           :string
    id_card            :string
    birth_date         :date
    gender             Gender
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
	children :audiometries
	has_many :advisings
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
