class MembersController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    @search = Member.search(params[:search])
    @members = @search.paginate(:page => params[:page])
  end

end
