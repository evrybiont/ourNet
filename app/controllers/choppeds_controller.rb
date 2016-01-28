class ChoppedsController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!

  def index
    @choppeds = current_user.choppeds
    respond_formats
  end
end
