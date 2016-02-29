class RegistrationsController < Devise::RegistrationsController
  private
 
  def sign_up_params
    allow = [:email, :password, :password_confirmation, :name]
    params.require(resource_name).permit(allow)
  end
end
