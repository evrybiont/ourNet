class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth request.env['omniauth.auth']
    if @user.persisted?
      if @user.info_full?
        sign_in_and_redirect @user, event: :authentication
      else
        sign_in @user, event: :authentication
        redirect_to edit_profile_path @user
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
