class ChopsController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!

  def index
    @chops = current_user.chops
    respond_formats
  end

  def new
    @chop = Chop.new
    respond_formats
  end

  def create
    @chop = current_user.chops.build chop_params
    if @chop.save
      flash.now[:success] = 'Chop has successfully created'
    end
    respond_formats
  end

  def chop_params
    params.require(:chop).permit(:name, :description)
  end
end
