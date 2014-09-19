class CommentsController < ApplicationController
  
  def get_feed
    Feed.new({atype: "comment", user_id: session[:user_id], key: 'feeds/comment/create', comment_id: @comment.id, task_id: @comment.task.id})
  end

  def new
    @comment=Comment.new
  end

  def create
    @comment=Comment.new(params[:comment])
    
    if @comment.save
      feed = get_feed
      feed.save
      user=User.find(session[:user_id])
      user.comments << @comment
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
    feed = get_feed
    feed.save
    @comment.destroy

    redirect_to task_path(@comment.task.url)
  end

end
