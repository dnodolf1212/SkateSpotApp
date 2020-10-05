class CommentsController < ApplicationController

  def new 
    @skatespot_id = params[:skatespot_id] if params[:skatespot_id]
    @comment = Comment.new

  end

  # current_user.skatespots.comments.new WHEN YOU ADD USER MODEL!!!
  def create 
    @comment = current_user.comments.new(comment_params)
    if @comment.save 
      redirect_to comments_path(@comment)
    else 
      render :new 
    end
  end
  
  def index 
    if params[:skatespot_id]
      @comments = Comment.find_by_skatespot_id(params[:skatespot_id]) 
    else
      @comments = Comment.all
    end
  end

  def edit 
    @comment = Comment.find_by_id(params[:id])
  end 

  def update 
    @comment = Comment.find_by_id(params[:id])
    @comment.update(comment_params)
    redirect_to comments_path(@comment)
  end

  def destroy 
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    flash[:alart] = "That Comment is Destroyed!!!!!!!!!"
    redirect_to comments_path
  end

  private 

  def comment_params 
    params.require(:comment).permit(:content, :busted?, :status, :skatespot_id)
  end

end