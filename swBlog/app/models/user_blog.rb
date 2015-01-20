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

class UserBlog < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
end
