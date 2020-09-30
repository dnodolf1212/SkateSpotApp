class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :delete]

  def index  
     @comments = Comment.all 
  end 

  def new
    @skatespot = Skatespot.find_by_id(params[:skatespot_id])
    @comment = Comment.new 
  
  end 

  def show 
  end 

  def create
  
    @comment = current_user.comments.build(comment_params)
    @comment.skatespot = Skatespot.find_by_id(params[:skatespot_id])
    
    if @comment.save 
      redirect_to skatespot_path(@skatespot_id, @comment)
    else 
      render :new 
    end 
  end 

  def edit
  
    @skatespot = Skatespot.find_by_id(params[:skatespot_id])
    binding.pry
  end 
 
  def update
   
    @comment.update(comment_params)
    redirect_to skatespot_path
  end 

  def destroy
    @comment.destroy
    redirect_to skatespots_path
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:content, :status, :busted)
  end

  def set_comment 
    @comment = current_user.comments.find_by_id(params[:id])
  end


end
