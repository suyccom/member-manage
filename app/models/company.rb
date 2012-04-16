class Company < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  fields do
    name :string
    address :string
    postal_code :string
    location  :string
    province  :string
    contact_person :string
    website :string
    phone :string
    mobile  :string
    email :email_address
    company_type  enum_string(:public, :private)
    timestamps
  end
  
  # --- Relations --- #
  has_many :projects
  has_many :advisings

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
