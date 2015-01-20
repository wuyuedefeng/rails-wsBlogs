class Admin::CategoriesController < ApplicationController
  def index
  	@categories = Category.all.order("created_at desc").page(params[:page])
  end

  def new
  	@category = Category.new
  end

  def create
  	p '----------'
  	p params
  	category = Category.new(params[:category].symbolize_keys)
  	if category.save
  		redirect_to '/admin/categories'
  	 else 	
  	 	render :action => :new
  	 end  
  end

  def destroy
  	category = Category.find(params[:id])
    category.destroy
    redirect_to action: :index
  end
end
