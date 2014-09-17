class CommentsController < ApplicationController
  
  def index
    @current_user=User.find(session[:user_id])
    @comments = @current_user.comments
  end
  
  def show
    @comment=Comment.find(params[:id])
    @current_user=User.find(session[:user_id])
  end
  
  def new
    @comment=Comment.new
  end
  
  def create
      @comment=Comment.new(params[:comment])
    
      if @comment.save
        u=User.find(session[:user_id])
        u.comments << @comment
        redirect_to task_path(@comment.task_id)
      else
        render 'tasks#new'
      end
      
    # if @comment.save
#       u=User.find(session[:user_id])
#       u.comments << @comment
#       redirect_to tasks_path
#     else
#       render "new"
#     end

  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    redirect_to task_path(@comment.task_id)
  end
  
end
