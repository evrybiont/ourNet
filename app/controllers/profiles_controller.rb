class ProfilesController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!

  def update
    render json: u.update(u_params)
  end

  private

  def u_params
    params.permit(:user_type, :name)
  end
end
