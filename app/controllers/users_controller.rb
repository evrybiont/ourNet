class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions!

  def index
    @users = User.order(created_at: :desc)
    respond_formats
  end
end
