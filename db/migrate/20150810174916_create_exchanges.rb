class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
    	t.string :name
    	t.string :suffix
    	t.string :description
        t.timestamps null: false
    end
  end
end
