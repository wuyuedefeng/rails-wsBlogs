class UserCategoriesController < ApplicationController
  def index
  	@categories = Category.all.order("add_this_user_count desc").page(params[:page])
  	@user_category_ids = UserCategory.user_category_ids current_user.user_categories
  	p '000000000'
  	p @user_category_ids
  end

  def create
  	user_category = UserCategory.where("user_id = ? and category_id = ?", current_user.id, params[:id])
  	if user_category.empty?
  		user_category = UserCategory.new
  		user_category.user_id = current_user.id
  		user_category.category_id = params[:id]
      # user_category.is_used = true
  		user_category.save
  	end
  	redirect_to action: :index
  end

  def update
  	p '2221111111111'
  	user_category = UserCategory.where("user_id = ? and category_id = ?", current_user.id, params[:id])
  	if user_category.present?
  		# user_category.is_used = params[:is_used]
  	 	# user_category.update
  	 else
  	 	user_category = UserCategory.new
  	 	user_category.user_id = current_user.id
  	 	user_category.category_id = params[:id]
  	 	# user_category.is_used = params[:is_used];
  	 	# user_category.save
  	 end 
  	 p '111112222222222222'
  	 redirect_to action: :index
  end

  def destroy
  	user_category = UserCategory.where("user_id = ? and category_id = ?", current_user.id, params[:id])
  	if user_category.present?
  		user_category.destroy
  	end
  	redirect_to action: :index
  end

end
