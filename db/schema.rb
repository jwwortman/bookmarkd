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

ActiveRecord::Schema.define(version: 20150417001022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.string   "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "format"
    t.string   "book_type"
    t.string   "location"
  end

  create_table "bookshelves", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "shelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookshelves", ["book_id", "shelf_id"], name: "index_bookshelves_on_book_id_and_shelf_id", using: :btree

  create_table "catalogs", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "catalogs", ["book_id", "library_id"], name: "index_catalogs_on_book_id_and_library_id", using: :btree

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "libraries", ["user_id"], name: "index_libraries_on_user_id", using: :btree

  create_table "shelves", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "library_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shelves", ["library_id", "created_at"], name: "index_shelves_on_library_id_and_created_at", using: :btree
  add_index "shelves", ["library_id"], name: "index_shelves_on_library_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "libraries", "users"
  add_foreign_key "shelves", "libraries"
end
