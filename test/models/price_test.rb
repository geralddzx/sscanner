# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  date       :date
#  open       :integer
#  high       :integer
#  low        :integer
#  close      :integer
#  volume     :integer
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  index_id   :integer
#

require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
