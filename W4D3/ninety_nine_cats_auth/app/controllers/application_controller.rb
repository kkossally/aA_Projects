class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? # Why do we need these helper methods?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user) 
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
  end

  def logged_in?
    !!current_user
  end

  def log_out!
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_session_url 
  end 

  def ensure_logged_in
    redirect_to new_session_url unless logged_in? 
  end
end
