class Advising < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    advice_date    :date
    advice_content :text
    contact_type enum_string(:user,:company,:contact)
    contact_data   :text
    timestamps
  end

  # --- Relations --- #
  belongs_to :advice_type
  belongs_to :member
  belongs_to :company

  # --- Calculated fields --- #
  def name
    if self.company.blank? && !self.member.blank?
      return self.member.name
    elsif self.member.blank? && !self.company.blank?
      return self.company.name
    end
  end

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
