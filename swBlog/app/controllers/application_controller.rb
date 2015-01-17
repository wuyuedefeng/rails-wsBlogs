class ApplicationController < ActionController::Base
	helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  config.filter_parameters = [:password, :password_confirmation]


  # Scrub sensitive parameters from your log  
  # filter_parameter_logging :password 
  helper_method :current_user_session, :current_user

  private  
  
  def current_user_session  
    @current_user_session ||= UserSession.find  
  end  
  
  def current_user  
    @current_user ||= current_user_session && current_user_session.record  
  end 

end
