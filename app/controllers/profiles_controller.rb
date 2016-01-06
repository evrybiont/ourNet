class ProfilesController < ApplicationController
  layout 'profile'

  before_action :authenticate_user!
  before_action :check_permissions!, only: :show

  def main
    update_u main_param
    redirect_to profile_path u
  end

  def update
    render json: update_u(param)
  end

  def edit
    redirect_to profile_path(u) if u.info_full?
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
    u.update data
  end
end
