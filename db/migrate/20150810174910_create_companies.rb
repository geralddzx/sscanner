class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.timestamps null: false
      t.string :ticker
	  t.string :name
	  t.string :industry
	  t.boolean :active
	  t.string :slug, unique: true
	  t.boolean :ignore, default: false
	  t.float :roar
	  t.integer :exchange_id
    end

    add_index :companies, :ticker
    add_index :companies, :exchange_id
    add_index :companies, [:ticker, :exchange_id], unique: true
  end
end
