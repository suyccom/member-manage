class Advising < ActiveRecord::Base

  hobo_model # Don't put anything above this

  include ActionView::Helpers::TextHelper # Need to use truncate here
  Ctypeenumstring = HoboFields::Types::EnumString.for(:user,:company,:contact)

  fields do
    advice_date    :date, :required
    advice_content :text
    contact_type   Advising::Ctypeenumstring
    contact_data   :text
    timestamps
  end

  # --- Relations --- #
  belongs_to :advice_type
  belongs_to :member
  belongs_to :company

  # --- Calculated fields --- #
  def name
    if self.is_user?
      return self.member.blank? ? I18n.t('member.erased') : self.member.name
    elsif self.is_company?
      return self.company.blank? ? I18n.t('company.erased') : self.company.name
    elsif self.is_contact?
      return self.contact_data.blank? ? I18n.t('advising.no_contact_data') : truncate(self.contact_data, :length => 30)
    end
  end

  def is_user?
    return self.contact_type == 'user' ? true : false
  end

  def is_company?
    return self.contact_type == 'company' ? true : false
  end

  def is_contact?
    return self.contact_type == 'contact' ? true : false
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
