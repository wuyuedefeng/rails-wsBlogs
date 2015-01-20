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
  	p '----------------==========1==create_blog'
    p params
    render :action => :index
  end
end
