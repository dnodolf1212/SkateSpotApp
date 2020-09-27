class ApplicationController < ActionController::Base
 
protect_from_forgery with: :exception

  def current_user 
    @user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def redirect_if_not_logged_in
    redirect_to '/login' unless logged_in?
  end 
  
end
