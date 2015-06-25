class AdvisingsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :member, :create
  
  def index
    @search = Advising.search(params[:search])
    @advisings = @search.paginate(:page => params[:page]).order('advice_date desc')
  end

  def show
    hobo_show do
      unless @advising.is_contact? # Contacts don't have any record
        @more_records = Advising.advice_type_is(@advising.advice_type)
        if @advising.is_user?
          @more_records = @more_records.member_is(@advising.member)
        end
        if @advising.is_company?
          @more_records = @more_records.company_is(@advising.company)
        end
      else
        @more_records = []
      end
    end
  end

  def new
    hobo_new do
      hobo_ajax_response if request.xhr?
    end
  end

  def edit
    @advising = Advising.find(params[:id])
    hobo_ajax_response if request.xhr?
  end

  def update
    hobo_update do
      @advising.update_attributes(:company => nil, :contact_data => nil) if params[:advising][:contact_type] == 'user'
      @advising.update_attributes(:member => nil, :contact_data => nil) if params[:advising][:contact_type] == 'company'
      @advising.update_attributes(:member => nil, :company => nil) if params[:advising][:contact_type] == 'contact'
    end
  end

end
