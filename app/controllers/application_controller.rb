class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |format|
      format.js {render js: "window.location.href='" + root_path + "'"}
      format.html {redirect_to root_path}
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    session['user_return_to'] || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    dashboards_path
  end

  def check_permissions!
    unless u.info_full?
      respond_to do |format|
        format.js {render js: "window.location.href='" + edit_profile_path(u) + "'"}
        format.html {redirect_to edit_profile_path(u)}
      end
    end
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
