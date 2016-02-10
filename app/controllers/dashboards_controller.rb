class DashboardsController < ApplicationController
  def index
    load_data
    respond_formats
  end

  private

  def load_data
    @chops = Chop.active
  end
end
