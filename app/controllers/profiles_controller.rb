class ProfilesController < ApplicationController
  layout 'profile'

  before_action :authenticate_user!
  before_action :check_permissions!, except: [:edit, :main]

  def main
    u.user_type = params[:user][:user_type]
    u.male = params[:user][:male]
    u.info_full = true
    u.save(validate: false)

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

  def change_avatar
    puts '###################===============#############################################'
    puts params_avatar

    if u.update params_avatar
      flash.now[:success] = 'Avatar has been changed'
      puts '==================DONE======================================================='
    else
      flash.now[:error] = u.errors.full_messages.first
    end

    respond_formats
  end

  private

  def param
    params.permit :name, :locality
  end

  def main_param
    params[:user].merge!({info_full: true})
    params.require(:user).permit(:user_type, :info_full, :male)
  end

  def update_u data
    if u.update data
      flash.now[:success] = "#{params[:attr]} has successfully updated"
    else
      flash.now[:error] = "You should enter your #{params[:attr]}"
    end
  end

  def params_avatar
    params.require(:user).permit(:avatar, :avatar_original_w, :avatar_original_h,
                                 :avatar_box_w, :avatar_aspect, :avatar_crop_x,
                                 :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end
end
