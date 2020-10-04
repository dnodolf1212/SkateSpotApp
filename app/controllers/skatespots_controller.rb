class SkatespotsController < ApplicationController
  before_action :set_spot, only: [:create, :show, :edit, :update, :destroy]
  
  def index 
    @skatespots = Skatespot.all
  end 

  def new 
    @skatespot = Skatespot.new
  end
  
  def show 
    if @skatespot == nil 
      flash[:alert] = "Nothing to see here!"
      redirect_to skatespots_path 
    end
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
    @skatespot.update(skatespot_params)
    redirect_to skatespots_path
  end 

  def destroy 
    @skatespot.destroy
    redirect_to skatespots_path
  end 

  private 

  def set_spot
     @skatespot = Skatespot.find_by_id(params[:id])
  end

  def skatespot_params 
    params.require(:skatespot).permit(:location, :nickname, :category, :description, :name )
  end
   
end
