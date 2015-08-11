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

class Company < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :ticker, use: [:slugged, :finders]

  	default_scope -> {where(ignore: false)}

	has_many :prices
	belongs_to :exchange
	belongs_to :list
end
