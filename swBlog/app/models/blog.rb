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
	belongs_to :category
	belongs_to :user
	has_many :user_blogs
	validates :title, presence: true
	validates :body, presence: true
	validates :category_id, presence: true

	paginates_per 10

end
