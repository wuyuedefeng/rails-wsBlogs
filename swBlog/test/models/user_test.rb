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
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
