class UsersController < ApplicationController
  def index
    @user_blog_count = Blog.where(:user_id => current_user.id).count
  end

  def show
    @user = current_user
  end

  #注册
  def new
  	@user = User.new 
  	p "===================#{@user_session}"
  end


  def create
  	@user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
      cookies[:auth_token] = @user.persistence_token
    else
      flash[:notice] = "用户已经存在"
      render 'new' 
    end
  end

  def active?
    puts 'active================------------------========'
    @user = User.find_using_perishable_token(params[:perishable_token])
    if user
      @user.active = true;
      @user.reset_perishable_token 
      @user.save
      flash[:notice] = 'active successful!'
      redirect_to root_url
    else

    end
    
  end


  def user_params
    params.require(:user).permit(:login, :username, :email, :password, :salt, :password_confirmation)
  end


end
