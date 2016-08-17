class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @person = Person.find(session[:id]) if session[:id]
  end
  helper_method :current_user
  def require_login
    redirect_to '/user/register' if session[:id] == nil
  end
end
