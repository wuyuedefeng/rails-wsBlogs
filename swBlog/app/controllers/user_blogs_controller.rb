class UserBlogsController < ApplicationController
  def index
  end

  def update
  	if current_user
  		user_blog = UserBlog.where(:user_id => current_user.id, :blog_id => params[:id] ).first_or_create
  		if params[:is_like] == "1"
  			user_blog.is_like = true
  			user_blog.is_dislike = false
  		elsif params[:is_like] == "-1"
  			user_blog.is_like = false
  			user_blog.is_dislike = true
  		end
  		user_blog.save
	end
	redirect_to blog_path(id: params[:id])
  end


end
