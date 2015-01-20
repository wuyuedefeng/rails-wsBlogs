# == Schema Information
#
# Table name: user_categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  is_used     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  scope :used, -> { where(:is_used => true) }

  def self.user_category_ids user_categories
  	user_categories.map { |e|  e.id}
  end


end
