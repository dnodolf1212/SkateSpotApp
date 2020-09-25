class SkatespotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index 
    @skatespots = if params[:comment_id]
      Comment.find_by_skatespot_id(params[:skatespot_id]).alpha_order
    else
      Skatespot.all
    end
  end 

  def new 
    @skatespot = Skatespot.new
    #@comment = Comment.find_by_id(params[:comment_id]) if params([:comment_id])
  end
  
  def show 
  end 
  
  def create 
    @skatespot = Skatespot.new(skatespot_params)
    if @skatespot.save
      redirect_to skatespot_path(@skatespot)
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

  def set_spot
    @skatespot = Skatespot.find_by_id(params[:id])
  end

  def skatespot_params 
    params.require(:skatespot).permit(:location, :nickname, :category, :name) 
  end
   
end
