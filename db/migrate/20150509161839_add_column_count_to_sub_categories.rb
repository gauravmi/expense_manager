class AddColumnCountToSubCategories < ActiveRecord::Migration
  def change
    add_column :sub_categories, :count, :integer, :default=>0
  end
end
