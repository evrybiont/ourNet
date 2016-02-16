class DashboardsController < ApplicationController
  def index
    load_data
    respond_formats
  end

  def show
    load_chop_info
    respond_formats
  end

  private

  def load_data
    @chops = Chop.active
  end

  def load_chop_info
    @chop = Chop.friendly.find params[:id]
    @chop_images = @chop.images.map{|i| [i.data.url]}
  end
end
