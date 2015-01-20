class CreateUserCategories < ActiveRecord::Migration
  def change
    create_table :user_categories do |t|
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_categories, :users
    add_foreign_key :user_categories, :categories
  end
end
