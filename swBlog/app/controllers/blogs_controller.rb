class BlogsController < ApplicationController
  before_action :is_login, except: [:show, :index]
  def index
    if params[:all_blog_search_text].present?
      query= params[:all_blog_search_text]
      if params[:all_blog_search_text].split(' ').count > 1
        query = params[:all_blog_search_text].split(' ').join('%')
      end
      @blogs = Blog.where("lower(title) LIKE lower(?) or lower(tags) LIKE lower(?)","%#{query}%","%#{query}%")
      .order("created_at desc").page(params[:page])
    elsif params[:my_blog_search_text].present?
      query = params[:my_blog_search_text]
      if params[:my_blog_search_text].split(' ').count > 1
        query = params[:my_blog_search_text].split(' ').join('%')
      end
      @blogs = Blog.where("user_id = lower(?) and (lower(title) LIKE lower(?) or lower(tags) LIKE ?)",
        current_user.id,"%#{query}%","%#{query}%").order("created_at desc").page(params[:page])
    else
      @blogs = current_user.blogs.order("created_at desc").page(params[:page])
    end
    
  end

  def new
    if current_user.categories.present?
      @blog = Blog.new
    else
      redirect_to user_categories_path
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @is_like_count = UserBlog.where("blog_id = ? and is_like = ?",@blog.id,true).count
    @is_dislike_count = UserBlog.where("blog_id = ? and is_dislike = ?",@blog.id,true).count
  end

  def edit
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
