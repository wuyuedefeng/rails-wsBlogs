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
end
