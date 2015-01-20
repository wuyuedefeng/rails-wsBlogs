# == Schema Information
#
# Table name: user_blogs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  blog_id    :integer
#  is_visited :boolean
#  is_like    :boolean
#  is_dislike :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserBlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
