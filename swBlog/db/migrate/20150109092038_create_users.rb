class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, limit: 30
      t.string :dodo_number, limit: 13,null: false
      t.string :email, limit: 25,null: false
      t.string :token, limit: 45,null: false
      t.string :account_state, limit: 10,null: false, default: '正常'
      t.timestamps null: false
    end
  end
end
