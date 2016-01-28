class ChopsController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!

  def index
    load_chops
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

  def destroy
    chop = Chop.find(params[:id])
    if chop.try(:destroy)
      flash.now[:success] = 'Chop has successfully removed'
    end
    load_chops
    respond_formats
  end

  private

  def chop_params
    params.require(:chop).permit(:name, :description)
  end

  def load_chops
    @chops = current_user.chops
  end
end
