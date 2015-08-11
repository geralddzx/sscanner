namespace :exchange do
  namespace :asx do
      desc "update asx companies list"
      task :update_companies => :environment do
          require 'get_companies_list'
          require 'csv'
          require 'open-uri'
          $ASX_LIST_URL = APP_CONFIG[:asx_list_url]
          $FILTER_VOLUME = APP_CONFIG[:filter_volume]
          $FILTER_PRICE = APP_CONFIG[:filter_price]
          $EXCHANGE_NAME = APP_CONFIG[:exchange_name]
          get_companies_list($ASX_LIST_URL,$FILTER_VOLUME,$FILTER_PRICE,$EXCHANGE_NAME)
      end
 
      desc "update prices"
      task :update_prices => :environment do
          require 'update_prices'
          $MAX_DAYS = APP_CONFIG[:max_days]
          Update_prices.get_prices($MAX_DAYS)
      end
  end
end