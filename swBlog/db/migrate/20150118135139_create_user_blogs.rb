class CreateUserBlogs < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
      t.references :user, index: true
      t.references :blog, index: true
      t.boolean :is_visited
      t.boolean :is_like
      t.boolean :is_dislike

      t.timestamps null: false
    end
    add_foreign_key :user_blogs, :users
    add_foreign_key :user_blogs, :blogs
  end
end
