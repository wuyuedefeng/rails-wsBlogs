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

ActiveRecord::Schema.define(version: 20150120142646) do

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.string   "title",       limit: 255
    t.string   "tags",        limit: 255
    t.text     "body",        limit: 65535
    t.integer  "permission",  limit: 4,     default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "blogs", ["category_id"], name: "index_blogs_on_category_id", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",                limit: 255,             null: false
    t.integer  "parent_id",           limit: 4,   default: 0, null: false
    t.integer  "add_this_user_count", limit: 4,   default: 0, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "content",    limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "user_blogs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "blog_id",    limit: 4
    t.boolean  "is_visited", limit: 1
    t.boolean  "is_like",    limit: 1
    t.boolean  "is_dislike", limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_blogs", ["blog_id"], name: "index_user_blogs_on_blog_id", using: :btree
  add_index "user_blogs", ["user_id"], name: "index_user_blogs_on_user_id", using: :btree

  create_table "user_categories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.boolean  "is_used",     limit: 1, default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_categories", ["category_id"], name: "index_user_categories_on_category_id", using: :btree
  add_index "user_categories", ["user_id"], name: "index_user_categories_on_user_id", using: :btree

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

  add_foreign_key "blogs", "categories"
  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "user_blogs", "blogs"
  add_foreign_key "user_blogs", "users"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
end
