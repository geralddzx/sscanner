# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

exchange = Exchange.new(name: "ASX", description: "Australian Securities Exchange", suffix: "AX").save!
exchange = Exchange.where(name: 'ASX').first
asx_list_url = APP_CONFIG[:asx_list_url]
filter_price = APP_CONFIG[:filter_price]
filter_volume = APP_CONFIG[:filter_volume]
exchange_name = APP_CONFIG[:exchange_name]
require 'get_companies_list'
require 'open-uri'
require 'csv'
get_companies_list(asx_list_url,filter_volume,filter_price,exchange_name)