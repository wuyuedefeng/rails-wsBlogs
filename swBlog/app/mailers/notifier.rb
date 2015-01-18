class Notifier < ApplicationMailer
	def password_reset_instructions(user)
        @user = user
    # @url  = 'http://example.com/login'
      mail(to: @user.email,
         subject: 'Welcome to My Awesome Site') do |format|
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
