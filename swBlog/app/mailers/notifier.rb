class Notifier < ApplicationMailer
	def password_reset_instructions(user)
        @user = user
    # @url  = 'http://example.com/login'
      mail(to: @user.email,
         subject: '密码重置请求－www.itrydo.com') do |format|
      format.html { render 'password_reset_intructions' }
      format.text { render text: 'Render text' }
    end

		# @user = user
		#  mail( :to => @user.email,
  #   		:subject => 'Password Reset Instructions' )


    	# subject      "Password Reset Instructions"
    	# from         "itrydo_notify@163.com"
    	# recipients   user.email
    	# content_type "text/html"
    	# sent_on      Time.now
    	
    end
end
