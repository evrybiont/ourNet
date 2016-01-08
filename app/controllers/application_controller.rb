class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    session['user_return_to'] || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    dashboards_path
  end

  def check_permissions!
    redirect_to edit_profile_path(u) unless u.info_full?
  end

  def respond_formats
    respond_to do |format|
      format.js
      format.html
    end
  end

  def u
    current_user
  end
  helper_method :u
end
