class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
  
  def user_logged_in
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to_login_url
  end
    
end    