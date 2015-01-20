class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,  :null => false
      t.integer :parent_id,  :null => false, :default => 0
      t.integer :add_this_user_count,  :null => false, :default => 0
      t.timestamps null: false
    end
  end
end
