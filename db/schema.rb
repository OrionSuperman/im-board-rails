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

ActiveRecord::Schema.define(version: 20160225000011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "game_has_categories", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "game_has_categories", ["category_id"], name: "index_game_has_categories_on_category_id", using: :btree
  add_index "game_has_categories", ["game_id"], name: "index_game_has_categories_on_game_id", using: :btree

  create_table "game_reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "title"
    t.text     "review"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_reviews", ["game_id"], name: "index_game_reviews_on_game_id", using: :btree
  add_index "game_reviews", ["user_id"], name: "index_game_reviews_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "minplayers"
    t.integer  "maxplayers"
    t.string   "length"
    t.string   "description"
    t.text     "about"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "user_has_games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_has_games", ["game_id"], name: "index_user_has_games_on_game_id", using: :btree
  add_index "user_has_games", ["user_id"], name: "index_user_has_games_on_user_id", using: :btree

  create_table "user_reviews", force: :cascade do |t|
    t.string   "title"
    t.integer  "rating"
    t.text     "review"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_reviews", ["user_id"], name: "index_user_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "description"
    t.text     "about"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "game_has_categories", "categories"
  add_foreign_key "game_has_categories", "games"
  add_foreign_key "game_reviews", "games"
  add_foreign_key "game_reviews", "users"
  add_foreign_key "user_has_games", "games"
  add_foreign_key "user_has_games", "users"
  add_foreign_key "user_reviews", "users"
end
