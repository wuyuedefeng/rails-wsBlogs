# == Schema Information
#
# Table name: categories
#
#  id                  :integer          not null, primary key
#  name                :string(255)      not null
#  parent_id           :integer          default("0"), not null
#  add_this_user_count :integer          default("0"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
