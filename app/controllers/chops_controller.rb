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

  def show
    load_chop
    respond_formats
  end

  def edit
    load_chop
    respond_formats
  end

  def update
    if load_chop.update chop_params
      flash.now[:success] = 'Chop has successfully updated'
    end
    load_chops
    respond_formats
  end

  def destroy
    if load_chop.try(:destroy)
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

  def load_chop
    @chop = Chop.friendly.find params[:id]
  end
end
