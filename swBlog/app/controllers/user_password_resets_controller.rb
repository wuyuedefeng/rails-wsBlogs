class UserPasswordResetsController < ApplicationController
  # Method from: http://github.com/binarylogic/authlogic_example/blob/master/app/controllers/application_controller.rb
  before_filter :require_no_user
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:alert] = "Instructions to reset your password have been emailed to you"
      redirect_to root_path
    else
      flash.now[:error] = "没有找到该邮箱 #{params[:email]} ,请检查是否输入正确或重新输入"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if params[:password].present? &&  params[:password_confirmation].present?
      @user.password = params[:password]
      # Only if your are using password confirmation
      @user.password_confirmation = params[:password_confirmation]

      # Use @user.save_without_session_maintenance instead if you
      # don't want the user to be signed in automatically.
      if @user.save
        flash[:success] = "您的密码成功更新"
        redirect_to @user
      else
        flash[:error] = "两次输入密码不一致，请重新输入"
        render :action => :edit
      end
    else
        flash[:error] = "密码输入不能为空"
        render :action => :edit
    end

    
  end


  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to root_url
    end
  end
end
