class ApplicationController < ActionController::Base
  
  def authorize
    if current_user.nil?
      redirect_to login_path
    end
  end
  
  protect_from_forgery
end
