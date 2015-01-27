class BlogsController < ApplicationController
  def index
    if params[:all_blog_search_text].present?
      @blogs = Blog.where("title LIKE ? or tags LIKE ?",
        params[:all_blog_search_text],params[:all_blog_search_text]).
        order("created_at desc").page(params[:page])
    elsif params[:my_blog_search_text].present?
      @blogs = Blog.where("user_id = ? and (title LIKE ? or tags LIKE ?)",
        current_user.id,params[:my_blog_search_text],params[:my_blog_search_text]).
        order("created_at desc").page(params[:page])
    else
      @blogs = current_user.blogs.order("created_at desc").page(params[:page])
    end
    
  end

  def new
  	@blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
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
