class Audiometry < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    audiometry_date :date
    audiometry_center :string
    re500 :integer
    re1000 :integer
    re2000 :integer
    re3000 :integer
    le500 :integer
    le1000 :integer
    le2000 :integer
    le3000 :integer
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
