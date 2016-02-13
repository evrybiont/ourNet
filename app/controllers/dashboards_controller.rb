class DashboardsController < ApplicationController
  def index
    load_data
    respond_formats
  end

  def show
    load_chop
    respond_formats
  end

  private

  def load_data
    @chops = Chop.active
  end

  def load_chop
    @chop = Chop.friendly.find params[:id]
  end
end
