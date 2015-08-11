class AddIndexIdInPrices < ActiveRecord::Migration
  def change
  	add_column :prices, :index_id, :integer
  end
end
