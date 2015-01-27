class UserCategoriesController < ApplicationController
  def index
  	@categories = Category.all.order("add_this_user_count desc").page(params[:page])
  	@user_category_category_ids = UserCategory.user_category_category_ids UserCategory.where("user_id = ?",current_user.id)
  end

  def update
  	p '2221111111111'
  	user_category = UserCategory.where("user_id = ? and category_id = ?", current_user.id, params[:id]).first
    p '========================----======'
    p params[:id]
    category = Category.find(params[:id])
    if user_category.present?
        user_category.destroy
        category.add_this_user_count -= 1
        category.save
  	else
  	 	user_category = UserCategory.new
  	 	user_category.user_id = current_user.id
  	 	user_category.category_id = params[:id]
  	 	user_category.is_used = true;
      category.add_this_user_count += 1
      category.save
  	 	user_category.save
  	end 
  	 redirect_to action: :index
  end

end
