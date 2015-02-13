class UserCategoriesController < ApplicationController
  before_action :is_login
  def index
  	@categories = Category.all.order("add_this_user_count desc").page(params[:page])
  	@user_category_category_ids = UserCategory.user_category_category_ids UserCategory.where("user_id = ?",current_user.id)
  end

  def update
  	user_category = UserCategory.where("user_id = ? and category_id = ?", current_user.id, params[:id]).first
    category = Category.find(params[:id])
    if user_category.present?
        user_category.destroy
        category.add_this_user_count -= 1
        category.save
  	else
  	 	user_category = UserCategory.new
  	 	user_category.user_id = current_user.id
  	 	user_category.category_id = params[:id]
      category.add_this_user_count += 1
      category.save
  	 	user_category.save
  	end 
  	 render text: "success"
  end

end
