# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  user_id    :integer
#  content    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
end
