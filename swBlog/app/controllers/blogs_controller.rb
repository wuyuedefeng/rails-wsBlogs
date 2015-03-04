class BlogsController < ApplicationController
  before_action :is_login, except: [:show, :index]
  def index
    if params[:my_blog_search_text].blank?
      if params[:all_blog_search_text].present?
        query = blog_research_works_decorate params[:all_blog_search_text]
        @blogs = Blog.where("lower(title) LIKE lower(?) or lower(tags) LIKE lower(?)","%#{query}%","%#{query}%")
        .order("created_at desc").page(params[:page])
      else
        if current_user
          @blogs = current_user.blogs.order("created_at desc").page(params[:page])
        else
          @blogs = Blog.all.order("created_at desc").page(params[:page])
        end
      end
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

  def show
    @blog = Blog.find(params[:id])
    @is_like_count = UserBlog.where("blog_id = ? and is_like = ?",@blog.id,true).count
    @is_dislike_count = UserBlog.where("blog_id = ? and is_dislike = ?",@blog.id,true).count
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(params[:blog].symbolize_keys)
    render action: :show
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
