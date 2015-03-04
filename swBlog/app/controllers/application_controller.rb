class ApplicationController < ActionController::Base
	helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  config.filter_parameters = [:password, :password_confirmation]


  # Scrub sensitive parameters from your log  
  # filter_parameter_logging :password 
  helper_method :current_user_session, :current_user, :blog_research_works_decorate

  private  
    def current_user_session  
      @current_user_session ||= UserSession.find  
    end  
    
    def current_user  
      @current_user ||= current_user_session && current_user_session.record  
    end 

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def is_login
      if current_user.blank?
        redirect_to login_in_user_sessions_path
      end
    end

    def is_admin
        if current_user.blank?
          redirect_to login_in_user_sessions_path
        elsif current_user.is_admin == false
          redirect_to root_path
        end
    end

    def blog_research_works_decorate search_words
      search_keys_tmp = search_words.squeeze(' ').split("")
      search_keys = []
      search_keys_tmp.each_with_index do |key,index|
        search_keys.push(key)
        if !((key >="a" && key <="z") || (key >="A" && key <="Z"))
          search_keys.push("%")
        else
          if(index == search_keys_tmp.size - 1)
            search_keys.push("%")
          else
            if(search_keys_tmp[index+1] >="a" && search_keys_tmp[index+1] <="z") || (search_keys_tmp[index+1] >="A" && search_keys_tmp[index+1] <="Z")
              next
            end
          end
        end

      end
      search_keys.join()
    end
      
end
