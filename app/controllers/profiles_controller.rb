class ProfilesController < ApplicationController
  layout 'profile'

  before_action :authenticate_user!
  before_action :check_permissions!, except: [:edit, :main]

  def main
    update_u main_param
    redirect_to profile_path u
  end

  def update
    update_u(param)
    respond_formats
  end

  def edit
    redirect_to profile_path(u) if u.info_full?
  end

  def show
    respond_formats
  end

  private

  def param
    params.permit :name
  end

  def main_param
    params[:user].merge!({info_full: true})
    params.require(:user).permit(:user_type, :info_full)
  end

  def update_u data
    if u.update data
      flash.now[:success] = 'Name has successfully updated'
    else
      flash.now[:error] = 'You should enter your name'
    end
  end
end
