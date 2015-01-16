class UserSessionsController < ApplicationController
  def index
  end

  def new
	@user_session = UserSession.new  
    respond_to do |format|  
    	format.html # new.html.haml  
    	format.xml  { render :xml => @user_session }  
    end
  end
  def create  
    @user_session = UserSession.new(user_session_params)  
    if @user_session.save  
      flash[:notice] = "Successfully logged in."  
      redirect_to root_path  
    else  
      render :action => 'new'
    end  
  end  
  def destroy  
    @user_session = UserSession.find  
    @user_session.destroy  
    flash[:notice] = "Successfully logged out."  
    redirect_to login_path, :format => params[:format]  
  end 

  def user_session_params
    puts '1111'
    puts params
    params.require(:user_session).permit(:login, :password)
  end
end
