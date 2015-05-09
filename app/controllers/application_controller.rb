class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login, :except => [:new,:create]
  helper_method :current_user

  def current_user
    @current_user ||= session[:user_id]
  end
  
  private
  def require_login
    unless current_user
      redirect_to login_new_path
    end
  end


end