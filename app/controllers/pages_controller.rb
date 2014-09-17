class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:index]
  
  def index
    @tasks = Task.where({:user_id => session[:user_id]})
    
  end
  
end
