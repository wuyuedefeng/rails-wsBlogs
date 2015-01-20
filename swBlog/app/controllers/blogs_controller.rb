class BlogsController < ApplicationController
  def index
  end

  def new
  	@blog = Blog.new
  end

  def show
  end

  def edit
  end

  def create
  	blog = Blog.new(blog_params)
    if blog.save
      flash[:notice] = "新增成功"
      render :action => :index
    else
      render json: {txt: "新增失败"} 
    end
    
  end

  private 
  def blog_params
    params.require(:blog).permit(:title, :tags, :body, :category_id)
  end
end
