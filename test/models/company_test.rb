# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ticker      :string
#  name        :string
#  industry    :string
#  active      :boolean
#  slug        :string
#  ignore      :boolean          default(FALSE)
#  roar        :float
#  exchange_id :integer
#  list_id     :integer
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
