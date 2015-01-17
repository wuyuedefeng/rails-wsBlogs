class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #ws design
      t.string :nickname, limit: 30
      t.integer :account_state, null: false, default: 0
      # authLogic
      t.string    :login,limit: 35,     :null => false                # 可选(Username)，可以用email来代替它，或者同时使用两者。  
      t.string    :email,limit: 50,     :null => false                # 可选，可以用login来代替它，或者同时使用两者。  
      t.string    :crypted_password,    :null => false                # 可选，但强烈建议加上。  
      t.string    :password_salt,       :null => false                # 可选，用于辅助密码验证的字段(不可逆算法进行密码验证时所需) 就是一个密钥,用来给Password加密  
      t.string    :persistence_token,   :null => false                # 必选   Authlogic内部使用的。它存储在你的cookies和session里，用于持久化当前用户的会话。这种方式比单纯的保存user id要安全得多
      t.string    :single_access_token, :null => false                # 可选，详见Authlogic::Session::Params  用于私有的API访问
      t.string    :perishable_token,    :null => false                # 可选，详见Authlogic::Session::Perishability  重置密码时使用
        
      # Magic columns，就像ActiveRecord的created_at和updated_at一样，这些字段由Authlogic自动维护。  
      t.integer   :login_count,         :null => false, :default => 0 # 可选，详见Authlogic::Session::MagicColumns  
      t.integer   :failed_login_count,  :null => false, :default => 0 # 可选，详见Authlogic::Session::MagicColumns  
      t.datetime  :last_request_at                                    # 可选，详见Authlogic::Session::MagicColumns  
      t.datetime  :current_login_at                                   # 可选，详见Authlogic::Session::MagicColumns  
      t.datetime  :last_login_at                                      # 可选，详见Authlogic::Session::MagicColumns  
      t.string    :current_login_ip                                   # 可选，详见Authlogic::Session::MagicColumns  
      t.string    :last_login_ip                                      # 可选，详见Authlogic::Session::MagicColumns  
      # ws
      t.timestamps null: false
    end
    add_index :users, ["login"], :name => "index_users_on_login", :unique => true  
    add_index :users, ["email"], :name => "index_users_on_email", :unique => true  
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
    add_index :users, :perishable_token, :unique => true
  end
end
