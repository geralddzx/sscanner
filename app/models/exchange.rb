# == Schema Information
#
# Table name: exchanges
#
#  id          :integer          not null, primary key
#  name        :string
#  suffix      :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Exchange < ActiveRecord::Base
	has_many :companies
end
