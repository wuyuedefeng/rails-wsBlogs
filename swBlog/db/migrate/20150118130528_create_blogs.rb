class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references :user, index: true
      t.references :category, index: true
      t.string :title
      t.string :tags
      t.text :body
      t.integer :permission,  :null => false, :default => 0 #0:公开 1:好友可见 2:仅自己可见

      t.timestamps null: false
    end
    add_foreign_key :blogs, :users
    add_foreign_key :blogs, :categories
  end
end
