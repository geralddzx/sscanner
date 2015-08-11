def get_companies_list(list_url,filter_volume,filter_price,exchange_name)
  reset_active_ignore
  exchange = Exchange.where(name: exchange_name).first
  exchange_suffix = exchange.suffix
 
  CSV.new(open(list_url)).each.each_with_index do |splitted,i|
    next if i < 3
    ticker = splitted[1].tr_s('"','').strip
    ticker = ticker + '.' + exchange_suffix unless exchange_suffix.nil?
    exchange.companies.create({
      :name => splitted[0].tr_s('"','').strip,
      :ticker => ticker,
      :industry => splitted[2].tr_s('"','').strip,
      :active => 1,
      :ignore => 0
     })  unless Company.unscoped.where(ticker: "#{ticker}").exists?
  end

  filter_stock(filter_volume,filter_price)
end
 
def filter_stock(filter_volume,filter_price)
  hydra = Typhoeus::Hydra.new(:max_concurrency => 20)
  Company.unscoped.distinct(:ticker).each_slice(200) do |tickers_list_slice|
    joined_list = tickers_list_slice.join('%2C%20')
    url="http://query.yahooapis.com/v1/public/yqlq=select
      %20*%20from%20yahoo.finance.quoteslist%20where%20symbol%3D
      '#{joined_list}'&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    request = Typhoeus::Request.new(url, :method => :get)
    request.on_complete do |resp|
      if resp.body.present?
        result = JSON.parse(resp.body) 
        result['query']['results']['quote'].each do |rr|
          rr_symbol = rr['symbol']
          if rr['Volume'].to_i < filter_volume 
              c = Company.unscoped.where(ticker: rr_symbol).first
              c.ignore = true
              c.save!
          elsif rr['Open'].to_f < filter_price
              c = Company.unscoped.where(ticker: rr_symbol).first
              c.ignore = true
              c.save!
           end
          end
        end
      end
      hydra.queue(request)
   end
   hydra.run
end
def reset_active_ignore
  Company.unscoped.each do |c|
    c.active = false
    c.ignore = false
    c.save!
  end
end
