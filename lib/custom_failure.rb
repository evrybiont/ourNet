class CustomFailure < Devise::FailureApp
  def redirect_url
    if params[:commit] == 'Log in' && params[:controller] == 'devise/sessions'
      new_user_session_path
    else
      dashboards_path
    end
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
