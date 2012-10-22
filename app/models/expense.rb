class Expense < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    concept :string, :name => true
    price   :decimal, :precision => 8, :scale => 2, :default => 0
    timestamps
  end
  
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
