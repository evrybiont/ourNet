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
    load_user
    @page = params[:page]
    if @page == 'following'
      @users = @user.followees(User).sort_by(&:created_at)
    elsif @page == 'followers'
      @users = @user.followers(User).sort_by(&:created_at)
    end
    respond_formats
  end

  def following
    load_following
    @page = 'following'
    respond_formats
  end

  def followers
    load_followers
    @page = 'followers'
    respond_formats
  end

  def stars
    load_stars
  end

  private

  def load_user
    id = params[:uid].present? ? params[:uid] : params[:id]
    @user = User.find id
  end

  def load_following
    @users = load_user.followees(User).sort_by(&:created_at)
  end

  def load_followers
    @users = load_user.followers(User).sort_by(&:created_at)
  end

  def load_stars
    @stars = load_user.likees(Chop).sort_by(&:created_at)
  end
end
