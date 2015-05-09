class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.float :amount
      t.integer :count, :default=>0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
