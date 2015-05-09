class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :expense
      t.date :date
      t.integer :sub_cat_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
