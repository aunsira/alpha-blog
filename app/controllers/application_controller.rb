class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    # Return user if session user id store in browser.
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # return true if current_user has value
    !!current_user
  end

  def required_user
    unless logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
