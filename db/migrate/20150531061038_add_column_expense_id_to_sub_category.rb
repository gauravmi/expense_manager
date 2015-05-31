class AddColumnExpenseIdToSubCategory < ActiveRecord::Migration
  def change
    add_column :sub_categories, :expense_id, :integer
  end
end
