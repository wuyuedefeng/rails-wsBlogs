class UsersController < ApplicationController
  def index
  end

  def show
  end

  #注册
  def new
  	@user = User.new 
  	p "===================#{@user_session}"
  end


  def create
  	@user = User.new(user_params)
    if @user.save!
      redirect_to root_url, :notice => "Signed up!"
      cookies[:auth_token] = @user.persistence_token
    else
      flash[:notice] = "User exists."
      render 'new' 
    end
  end


  def user_params
    params.require(:user).permit(:login, :username, :email, :password, :salt, :password_confirmation)
  end


end
