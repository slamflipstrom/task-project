class ProjectsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    @projects=Project.all
    # Was originally ^ ".where({:user_id => session[:user_id]})"
    
    #TODO: Needs to be added once join table has been established
    # @current_user=User.find(session[:user_id])
  end
  
  def show
    @project=Project.find(params[:id])
  end
  
  def new
    @project=Project.new
    #TODO: Check on this view file
    # @categories=Category.all
  end
  
  def create
    @project=Project.new(params[:project])
    
    if @project.save
      redirect_to projects_path
    else
      render "new"
    end
  end
  
  def edit
    @project=Project.find(params[:id])
  end
  
  def update
    @project=Project.find(params[:id])
    
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project.id)
    else
      render "edit"
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
end
