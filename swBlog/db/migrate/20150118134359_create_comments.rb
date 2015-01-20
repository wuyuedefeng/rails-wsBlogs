class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :blog, index: true
      t.references :user, index: true
      t.string :content, null: false

      t.timestamps null: false
    end
    add_foreign_key :comments, :blogs
    add_foreign_key :comments, :users
  end
end
