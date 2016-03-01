class CustomFailure < Devise::FailureApp
  def redirect_url
    dashboards_path
    new_user_session_path if params[:commit] == 'Log in' && params[:controller] == 'sessions'
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
