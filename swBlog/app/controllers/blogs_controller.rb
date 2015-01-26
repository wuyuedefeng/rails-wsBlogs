class BlogsController < ApplicationController
  def index
    @blogs = current_user.blogs.order("created_at desc").page(params[:page])
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
