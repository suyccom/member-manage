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

end
