class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:index]
  
  def index
    @activities = PublicActivity::Activity.all
    
    if current_user
      @tasks = Task.where({:user_id => session[:user_id]})
    end
  
  end
  
end
