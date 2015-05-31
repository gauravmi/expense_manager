class AddColumnExpenseIdToMainCategory < ActiveRecord::Migration
  def change
    add_column :main_categories, :expense_id, :integer
  end
end
