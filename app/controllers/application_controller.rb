class ApplicationController < ActionController::Base  
  protect_from_forgery
  helper_method :current_user
  hide_action :current_user
  before_filter :authorize
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def authorize
    if current_user.nil?
      redirect_to login_path, :alert => "You need to log in to do that."
    end
  end

end
