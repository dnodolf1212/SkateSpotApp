class CommentsController < ApplicationController

  def new 
    @skatespot = Skatespot.find_by_id(params[:skatespot_id])
    @comment = Comment.new
  end


  def create 
    @comment = current_user.comments.new(comment_params)
    if @comment.save 
      redirect_to skatespot_comments_path(@comment)
    else 
      render :new 
    end
  end
  
  def index  
      current_user.comments = Comment.all
  end

  def edit 
    @comment = Comment.find_by_id(params[:id])
    @skatespot = @comment.skatespot 
  end 

  def update 
    @comment = Comment.find_by_id(params[:id])
    @comment.update(comment_params)
    redirect_to skatespot_comments_path(@comment)
  end

  def destroy 
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    flash[:alart] = "That Comment is Destroyed!!!!!!!!!"
    redirect_to skatespot_comments_path
  end

  private 

  def comment_params 
    params.require(:comment).permit(:content, :busted?, :status, :skatespot_id)
  end

end