class AddListIdInCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :list_id, :integer
  end
end
