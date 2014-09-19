class LoginsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, notice: "Invalid Login"
    end
  end
  
  def destroy
    session[:user_id] = nil # Could also call `reset_session` to clear the entire session.
    redirect_to root_path
  end

end
