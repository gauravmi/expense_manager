class RenameColumnMainCatIdToMainCategoryIdOnSubCategory < ActiveRecord::Migration
  def change
  	rename_column :sub_categories, :main_cat_id, :main_category_id
  end
end
