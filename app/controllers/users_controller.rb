class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :new]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      feed = Feed.new({atype: "user", user_id: @user.id, key: 'feeds/user/create'})
      feed.save
      redirect_to root_path
    else
      render 'new'
    end
    
  end
  
end
