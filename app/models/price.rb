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

class Price < ActiveRecord::Base
	belongs_to :company
	belongs_to :index
end
