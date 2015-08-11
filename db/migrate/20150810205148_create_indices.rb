class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
    	t.string :name
    	t.string :ticker
    	t.string :roar
      t.timestamps null: false
    end
  end
end
