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
      feed = Feed.new({atype: "comment", user_id: session[:user_id], key: 'feeds/comment/create', comment_id: @comment.id, task_id: @comment.task.id})
      feed.save
      u=User.find(session[:user_id])
      u.comments << @comment
      redirect_to task_path(@comment.task.url)
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
<<<<<<< HEAD
    @comment.create_activity :destroy, owner: current_user
=======
    feed = Feed.new({atype: "comment", user_id: session[:user_id], key: 'feeds/comment/destroy', comment_id: @comment.id, task_id: @comment.task.id})
    feed.save
>>>>>>> master
    @comment.destroy

    redirect_to task_path(@comment.task.url)
  end

end
