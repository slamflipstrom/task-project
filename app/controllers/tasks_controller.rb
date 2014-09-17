class TasksController < ApplicationController
  
  def index
    # @tasks=Task.all
    
    @tasks=Task.where({:user_id => session[:user_id]})
  end
  
  def show
    @task=Task.find(params[:id])
  end
  
  def new
    @user=User.find(session[:user_id])
    @task=Task.new
    @categories=Category.all
  end
  
  def create
    @task=Task.new(params[:task])
    
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end
  
  def edit
    @user=User.find(session[:user_id])
    @categories=Category.all
    @task=Task.find(params[:id])
  end
  
  def update
    @task=Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      redirect_to task_path(@task.id)
    else
      render "edit"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
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
