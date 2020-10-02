class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_skatespot, only: [:index]
  def index 
    #binding.pry 
     @comments = Comment.all 
  end 

  def new
    @skatespot = Skatespot.find_by_id(params[:skatespot_id])
    @comment = Comment.new 
  end 

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.skatespot = Skatespot.find_by_id(params[:skatespot_id])
    if @comment.save 
      redirect_to skatespot_comment_path([:skatespot_id], @comment)
    else 
      render :new 
    end 
  end 

  def edit
    #binding.pry
    @skatespot = @comment.skatespot
  end 
 
  def update
   
    @comment.update(comment_params)
    redirect_to skatespot_comment_path
  end 

  def destroy
    @comment.destroy
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
