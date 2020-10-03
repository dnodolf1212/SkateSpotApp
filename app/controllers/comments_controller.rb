class CommentsController < ApplicationController
  before_action :set_comment, only [:show, :edit, :update, :destroy]
  before_action :set_skatespot, only: [:index]
  
  def index 
    if params[:skatespot_id]
     @comments = Comment.find_by_skatespot_id(params[:skatespot_id]) 
    else
     @comments = Comment.all 
    end
  end 

  def new
    @skatespot = Skatespot.find_by_id(params[:skatespot_id])
    @comment = Comment.new 
  end 

  def create
    
    @comment = current_user.comments.build(comment_params)
    
      if @comment.save 
        redirect_to skatespot_comments_path([:skatespot_id], @comment)
      else 
        render :new 
    end 
  end 

  def edit
    @skatespot = Skatespot.find_by_id(params[:id])
  end 
 
  def update
   @comment.update(comment_params)
   redirect_to skatespot_comment_path
  end 

  def destroy
    @comment.delete
    redirect_to skatespot_comments_path
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:content, :status, :busted, :skatespot_id)
  end

  def set_comment 
    @comment = current_user.comments.find_by_id(params[:id])
  end

  def set_skatespot
    @skatespot = Skatespot.find_by_id(params[:skatespot_id])
  end


end
