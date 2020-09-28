class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :delete]

  def index  
     @comments = Comment.all 
  end 

  def new
    @comment = Comment.new 
  end 

  def show 
  end 

  def create
     @comment = current_user.comments.build(comment_params)
     if @comment.save 
      redirect_to comments_path(@comment)
     else 
      render :new 
     end 
  end 

  def edit 
  end 

  def update
    @comment.update(comment_params)
  end 

  def destroy
    @comment.destroy
    redirect_to skatespots_path
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:content, :status, :busted, :skatespot_id)
  end

  def set_comment 
    @comment = current_user.comments.find_by_id(params[:id])
  end


end
