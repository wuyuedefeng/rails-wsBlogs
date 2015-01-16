# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  nickname      :string(30)
#  dodo_number   :string(13)       not null
#  email         :string(25)       not null
#  token         :string(45)       not null
#  account_state :string(10)       default("正常"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
end
