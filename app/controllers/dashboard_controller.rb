class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = User.all
  end
end
