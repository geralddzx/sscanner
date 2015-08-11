class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
    	t.date :date
  		t.integer :open
 		t.integer :high
  		t.integer :low
 		t.integer :close
  		t.integer :volume
  		t.integer :company_id
        t.timestamps null: false
    end

    add_index :prices, :date
    add_index :prices, :company_id
  end
end
