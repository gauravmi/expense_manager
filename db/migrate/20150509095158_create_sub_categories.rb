class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|    
      t.string :name
      t.string :icon
      t.integer :main_cat_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
