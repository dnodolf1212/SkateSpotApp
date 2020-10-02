class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to skatespots_path 
    else
      render :new
    end
  end
    
  def facebook 
    binding.pry
    if @user = User.find_or_create_by_facebook(auth)
      session[:user_id] = @user.id
      redirect_to skatespots_path
    else
      redirect_to login_path
    end
  end


  def destroy
    session.clear 
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end
