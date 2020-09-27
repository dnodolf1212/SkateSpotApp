class SkatespotsController < ApplicationController
  before_action :set_spot, only: [:create, :show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in
 
  
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
    if @skatespot
    @skatespot = Skatespot.find_by_id(params[:id])
    else
      flash[:alert] = "Nothing to see there boss"
      redirect_to skatespots_path
    end 
  end

  def skatespot_params 
    params.require(:skatespot).permit(:location, :nickname, :category, :description, :name) 
  end
   
end
