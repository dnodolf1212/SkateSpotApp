class SkatespotsController < ApplicationController
  before_action :set_spot, only: [:create, :show, :edit, :update, :destroy]
  
  def index 
    if current_user
    @skatespots = Skatespot.search(params[:search])
    elsif search
      redirect_to skatespot_path(skatespot)
    else
      redirect_to login_path
    end
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
    if @skatespot
      render :edit 
    else 
      redirect_to skatespots_path 
    end
  end 

  def update
    @skatespot.update(skatespot_params)
    redirect_to skatespot_path
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
    params.require(:skatespot).permit(:location, :nickname, :category, :description, :name, :search )
  end
   
end
