class RenameColumnSubCatIdToSubCategoryIdOnExpenses < ActiveRecord::Migration
  def change
  	rename_column :expenses, :sub_cat_id, :sub_category_id
  end
end
