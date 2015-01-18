# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  title       :string(255)
#  tags        :string(255)
#  body        :text(65535)
#  permission  :integer          default("0"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ActiveRecord::Base
end
