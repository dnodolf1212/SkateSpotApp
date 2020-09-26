class CommentsController < ApplicationController

  def index  
     @comments = Comment.all 
  end 

  def new
    @comment = Comment.new 
  end 

  def show 
  end 

  def create
     @comment = Comment.new(comment_params)
     if @comment.save 
      redirect_to comments_path(@comment)
     else 
      render :new 
     end 
  end 

  def edit 
  end 

  def update 
  end 

  def destroy
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:content, :status, :busted, :skatespot_id)
  end


end
