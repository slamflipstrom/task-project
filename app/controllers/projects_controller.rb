class ProjectsController < ApplicationController
  
  def index
    @current_user=User.find(session[:user_id])
    @projects = @current_user.projects
  end
  
  def show
    @project=Project.find(params[:id])
  end
  
  def new
    @project=Project.new
  end
  
  def create
    @project=Project.new(params[:project])
    
    if @project.save
      @project.create_activity :create, owner: current_user
      u=User.find(session[:user_id])
      u.projects << @project
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
      @project.create_activity :update, owner: current_user
      redirect_to project_path(@project.id)
    else
      render "edit"
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.create_activity :destroy, owner: current_user
    @project.destroy
    
    redirect_to projects_path
  end
  
end
