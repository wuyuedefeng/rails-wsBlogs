class UserBlogsController < ApplicationController
  before_action :is_login, except: [:show]
  def index
    if params[:my_blog_search_text].blank?
      @blogs = current_user.blogs.order("created_at desc").page(params[:page])
    else
      query = blog_research_works_decorate params[:my_blog_search_text]
      @blogs = Blog.where("user_id = lower(?) and (lower(title) LIKE lower(?) or lower(tags) LIKE ?)",
        current_user.id,"%#{query}%","%#{query}%").order("created_at desc").page(params[:page])
    end
  end

  def new
    if current_user.categories.present?
      @blog = Blog.new
    else
      redirect_to user_categories_path
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
    @is_like_count = UserBlog.where(:blog_id => @blog.id, :is_like => true).count
    @is_dislike_count = UserBlog.where(:blog_id => @blog.id, :is_dislike => true).count
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(params[:blog].symbolize_keys)
    render action: :show
  end

  def update_like
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
  	redirect_to user_blog_path(id: params[:id])
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    if blog.save
      flash[:notice] = "新增成功"
      redirect_to action: :index
    else
      render json: {txt: "新增失败"} 
    end
    
  end
  private 
    def blog_params
      params.require(:blog).permit(:title, :tags, :body, :category_id)
    end

end
