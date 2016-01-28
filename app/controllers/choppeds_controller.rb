class ChoppedsController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!

  def index
    respond_formats
  end
end
