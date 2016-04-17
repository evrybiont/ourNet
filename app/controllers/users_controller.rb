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

  def toggle_follow
    u.toggle_follow!(User.find params[:id])
    if params[:page] == 'following'
      @users = u.followees(User)
    elsif params[:page] == 'followers'
      @users = u.followers(User)
    end
    load_user
    respond_formats
  end

  def following
    load_following
    respond_formats
  end

  def followers
    load_followers
    respond_formats
  end


  private

  def load_user
    id = params[:uid].present? ? params[:uid] : params[:id]
    @user = User.find id
  end

  def load_following
    @users = load_user.followees(User)
  end

  def load_followers
    @users = load_user.followers(User)
  end
end
