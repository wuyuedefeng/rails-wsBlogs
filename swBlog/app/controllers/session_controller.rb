class SessionController < ApplicationController
  def index
  end

  def new
  	@user_session = User.new
  end
end
