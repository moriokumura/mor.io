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

ActiveRecord::Schema.define(version: 20150204134906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_items", force: :cascade do |t|
    t.integer  "list_id",     null: false
    t.string   "title",       null: false
    t.string   "subtitle"
    t.string   "url"
    t.text     "description"
    t.integer  "position",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "list_items", ["list_id"], name: "index_list_items_on_list_id", using: :btree
  add_index "list_items", ["position"], name: "index_list_items_on_position", using: :btree

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "title",                       null: false
    t.string   "slug",                        null: false
    t.text     "description"
    t.integer  "list_item_count", default: 0, null: false
    t.datetime "published_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "lists", ["slug"], name: "index_lists_on_slug", unique: true, using: :btree
  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "slug",                               null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit",      null: false
    t.json     "object"
    t.json     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
