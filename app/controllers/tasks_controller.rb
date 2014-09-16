class TasksController < ApplicationController
  
  def index
    # @tasks=Task.all
    
    @tasks=Task.where({:user_id => session[:user_id]})
  end
  
  def show
    @task=Task.find(params[:id])
  end
  
  def new
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
  
end
