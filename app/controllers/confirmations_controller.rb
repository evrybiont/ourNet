class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, user)
    sign_in user, event: :authentication
    edit_profile_path user
  end
end
