class BlogsController < ApplicationController
  before_action :is_login, except: [:show, :index]
  def index
    if params[:all_blog_search_text].present?
      query = blog_research_works_decorate params[:all_blog_search_text]
      @blogs = Blog.where("lower(title) LIKE lower(?) or lower(tags) LIKE lower(?)","%#{query}%","%#{query}%")
      .order("created_at desc").page(params[:page])
    else
      @blogs = Blog.all.order("created_at desc").page(params[:page])
    end
  end

  def new
    if current_user.categories.present?
      @blog = Blog.new
    else
      redirect_to user_categories_path
    end
  end

  


  

  



  
end
