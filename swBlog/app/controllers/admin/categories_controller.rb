class Admin::CategoriesController < ApplicationController
  def index
  	@categories = Category.all.order("created_at desc").page(params[:page])
  end

  def new
  end

  def create
  	category = Category.new(params[:category])
  	category.save
  end
end
