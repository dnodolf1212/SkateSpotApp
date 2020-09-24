class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def new 
    
  end 

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to skatespot_path
    else 
      redirect_to login_path
    end
  end 

  

end
