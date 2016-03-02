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

ActiveRecord::Schema.define(version: 20160301212640) do

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
    t.string   "title"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventaddresses", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "eventaddresses", ["event_id"], name: "index_eventaddresses_on_event_id", using: :btree

  create_table "eventgames", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "eventgames", ["event_id"], name: "index_eventgames_on_event_id", using: :btree
  add_index "eventgames", ["game_id"], name: "index_eventgames_on_game_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "about"
    t.integer  "seats"
    t.integer  "user_id"
    t.boolean  "open"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date"
    t.time     "time"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "eventskills", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "skilllevel_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "eventskills", ["event_id"], name: "index_eventskills_on_event_id", using: :btree
  add_index "eventskills", ["skilllevel_id"], name: "index_eventskills_on_skilllevel_id", using: :btree

  create_table "eventusers", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "accepted"
    t.boolean  "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "eventusers", ["event_id"], name: "index_eventusers_on_event_id", using: :btree
  add_index "eventusers", ["user_id"], name: "index_eventusers_on_user_id", using: :btree

  create_table "gamecategories", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "gamecategories", ["category_id"], name: "index_gamecategories_on_category_id", using: :btree
  add_index "gamecategories", ["game_id"], name: "index_gamecategories_on_game_id", using: :btree

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

  create_table "skilllevels", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usergames", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "usergames", ["game_id"], name: "index_usergames_on_game_id", using: :btree
  add_index "usergames", ["user_id"], name: "index_usergames_on_user_id", using: :btree

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
  add_foreign_key "eventaddresses", "events"
  add_foreign_key "eventgames", "events"
  add_foreign_key "eventgames", "games"
  add_foreign_key "events", "users"
  add_foreign_key "eventskills", "events"
  add_foreign_key "eventskills", "skilllevels"
  add_foreign_key "eventusers", "events"
  add_foreign_key "eventusers", "users"
  add_foreign_key "gamecategories", "categories"
  add_foreign_key "gamecategories", "games"
  add_foreign_key "usergames", "games"
  add_foreign_key "usergames", "users"
end
