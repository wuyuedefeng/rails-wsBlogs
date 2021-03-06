# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  nickname            :string(30)
#  account_state       :integer          default("0"), not null
#  login               :string(35)       not null
#  email               :string(50)       not null
#  crypted_password    :string(150)      not null
#  password_salt       :string(50)       not null
#  persistence_token   :string(150)      not null
#  single_access_token :string(50)       not null
#  perishable_token    :string(50)       not null
#  login_count         :integer          default("0"), not null
#  failed_login_count  :integer          default("0"), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(30)
#  last_login_ip       :string(30)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  is_admin            :boolean          default("0"), not null
#

class User < ActiveRecord::Base
	has_many :blogs
	has_many :user_categories
	has_many :categories, :through => :user_categories

	acts_as_authentic do |config|  
  		# config.ignore_blank_passwords = true  #密码留空并提交的时候把密码清空
	end 
	def self.find_by_username_or_email(login)
  		User.find_by_login(login) || User.find_by_email(login)
	end

	enum account_state: %i(nomal deactivate)
	def account_state_zh
		en_to_zh = {
			"nomal" => "正常",
			"deactivate" => "冻结"
		}
		en_to_zh[self.account_state]
	end

	def login_in_nickname_or_others
		if self.login.present?
			self.login
		elsif self.email.present?
			self.email
		else
			"guest"
		end
	end

	def deliver_password_reset_instructions!
    	reset_perishable_token!
    	Notifier.password_reset_instructions(self).deliver_now
  	end



end
