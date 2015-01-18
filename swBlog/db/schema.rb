# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150109092038) do

  create_table "users", force: :cascade do |t|
    t.string   "nickname",            limit: 30
    t.integer  "account_state",       limit: 4,   default: 0, null: false
    t.string   "login",               limit: 35,              null: false
    t.string   "email",               limit: 50,              null: false
    t.string   "crypted_password",    limit: 150,             null: false
    t.string   "password_salt",       limit: 50,              null: false
    t.string   "persistence_token",   limit: 150,             null: false
    t.string   "single_access_token", limit: 50,              null: false
    t.string   "perishable_token",    limit: 50,              null: false
    t.integer  "login_count",         limit: 4,   default: 0, null: false
    t.integer  "failed_login_count",  limit: 4,   default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    limit: 30
    t.string   "last_login_ip",       limit: 30
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["perishable_token"], name: "index_users_on_perishable_token", unique: true, using: :btree
  add_index "users", ["persistence_token"], name: "index_users_on_persistence_token", unique: true, using: :btree

end
