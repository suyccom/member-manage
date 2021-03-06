class AdviceType < ActiveRecord::Base

  hobo_model # Don't put anything above this
  default_scope :order => 'name ASC'

  fields do
    name        :string
    description :text
    timestamps
  end

  # --- Relations --- #
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
    self.advisings.blank?
  end

  def view_permitted?(field)
    true
  end

end
