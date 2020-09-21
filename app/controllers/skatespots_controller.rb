class SkatespotsController < ApplicationController

  def index 
    @skatespots = Skatespot.all
  end 

  def show 
    set_spot
  end 

  def new 
    @skatespot = Skatespot.new
  end
  
  def create 
    set_spot
  end 
  
  def edit
    set_spot 
  end 

  def update
    set_spot
  end 

  def destroy
    set_spot 
  end 

  private 

  def set_spot
    @skatespot = Skatespot.find_by_id(params[:id])
  end

end
