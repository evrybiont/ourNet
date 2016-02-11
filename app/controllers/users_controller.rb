class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions!

  def index
    @users = User.all
    respond_formats
  end
end
