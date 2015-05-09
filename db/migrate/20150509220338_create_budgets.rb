class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.float :amount
      t.date :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
