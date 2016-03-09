class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions!

  def index
    @users = User.order(created_at: :desc)
    respond_formats
  end

  def show
    load_user
    respond_formats
  end

  private

  def load_user
    @user = User.find params[:id]
  end
end
