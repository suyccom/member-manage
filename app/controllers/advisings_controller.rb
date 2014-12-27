class AdvisingsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :member, :create
  
  def new
    hobo_new do
      hobo_ajax_response if request.xhr?
    end
  end

  def index
    @search = Advising.search(params[:search])
    @advisings = @search.paginate(:page => params[:page])
    hobo_index Advising.apply_scopes(
      :order => "advice_date desc"
    )
  end

  def show
    hobo_show do
      @more_records = Advising.advice_type_is(@advising.advice_type)
      unless @advising.member.blank?
        @more_records = @more_records.member_is(@advising.member)
      end
      unless @advising.company.blank?
        @more_records = @more_records.company_is(@advising.company)
      end
    end
  end
end
