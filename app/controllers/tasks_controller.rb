class TasksController < ApplicationController
  
  
  def index
    # @tasks=Task.all
    
    @tasks=Task.where({:user_id => session[:user_id]})
  end
  
  def show
    @comment=Comment.new
    @user=User.find(session[:user_id])
    @users=User.all
    @categories=Category.all
    @task=Task.find_by_url(params[:id])
    @assignee=User.find(@task.user_id)
  end
  
  def new
    if params.include?(:project_id)
      @project=Project.find(params[:project_id])
      @p_id=@project.id
    else
      @p_id=nil
    end
    
    @user=User.find(session[:user_id])
    @task=Task.new
    @categories=Category.all
  end
  
  def create
    @task=Task.new(params[:task])
    @comment=Comment.new(params[:comment])
    
    if @task.save
      @task.create_activity :create, owner: current_user
      if @task.project_id == nil
        redirect_to tasks_path
      else
        redirect_to project_path(@task.project_id)
      end
      
    else
      render "new"
    end
  end
  
  def edit
    @user=User.find(session[:user_id])
    @categories=Category.all
    @task=Task.find_by_url(params[:id])
  end
  
  def update
    @task=Task.find_by_url(params[:id])
    
    if @task.update_attributes(params[:task])
      @task.create_activity :update, owner: current_user
      redirect_to task_path(@task.url)
    else
      render "edit"
    end
  end
  
  def assign
    @task=Task.find_by_url(params[:task][:task_id])
    @user = User.find(session[:user_id])
    
    user_id = params[:task][:user_id].to_i
    
    if @task.update_attributes(:user_id => user_id)
      Pony.options = {
        :to => @task.user.email,
        :body => 'You have been assigned to a task.',
        :via => :smtp,
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'taskmate.ocs@gmail.com',
          :password             => 'derpderpderp',
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        }
      }

      Pony.mail(:from => 'taskmate.ocs@gmail.com')
      
      redirect_to task_path(@task.url), :notice => "You have notified #{@task.user.name} of their new task."
    else
      render "edit", :alert => "Oh, no, something went wrong!"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.create_activity :destroy, owner: current_user
    @task.destroy
    
    redirect_to tasks_path
  end
  
  def sort
    params[:task].each_with_index do |id, index|
      Task.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
end
