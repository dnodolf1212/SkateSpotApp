class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to skatespots_path 
    else
      flash[:alert] = "Looks like you have to sign up first!!"
      render :new
    end
  end
    
  def facebook 
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
