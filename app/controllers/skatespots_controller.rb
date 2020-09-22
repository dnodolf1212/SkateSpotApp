class SkatespotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index 
    @skatespots = Skatespot.all
  end 

  def new 
    @skatespot = Skatespot.new
    
  end
  
  def show 
  end 
  
  def create 
    @skatespot = Skatespot.new(skatespot_params)
    if @skatespot.valid? 
      @skatespot.save
      redirect_to 
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
