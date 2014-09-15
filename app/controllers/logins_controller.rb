class LoginsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  
  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to articles_path
    else
      raise "Invalid login."
    end
  end
  
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  helper_method :current_user
  
  def destroy
    session[:user_id] = nil # Could also call `reset_session` to clear the entire session.
    redirect_to articles_path
  end

end
