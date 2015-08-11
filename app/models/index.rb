# == Schema Information
#
# Table name: indices
#
#  id         :integer          not null, primary key
#  name       :string
#  ticker     :string
#  roar       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Index < ActiveRecord::Base
	has_many :prices
end
