# == Schema Information
#
# Table name: user_categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def self.user_category_category_ids user_categories
  	user_categories.map { |e|  e.category_id}
  end


end
