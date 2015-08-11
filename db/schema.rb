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

ActiveRecord::Schema.define(version: 20150810205305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "ticker"
    t.string   "name"
    t.string   "industry"
    t.boolean  "active"
    t.string   "slug"
    t.boolean  "ignore",      default: false
    t.float    "roar"
    t.integer  "exchange_id"
    t.integer  "list_id"
  end

  add_index "companies", ["exchange_id"], name: "index_companies_on_exchange_id", using: :btree
  add_index "companies", ["ticker", "exchange_id"], name: "index_companies_on_ticker_and_exchange_id", unique: true, using: :btree
  add_index "companies", ["ticker"], name: "index_companies_on_ticker", using: :btree

  create_table "exchanges", force: :cascade do |t|
    t.string   "name"
    t.string   "suffix"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "indices", force: :cascade do |t|
    t.string   "name"
    t.string   "ticker"
    t.string   "roar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.date     "date"
    t.integer  "open"
    t.integer  "high"
    t.integer  "low"
    t.integer  "close"
    t.integer  "volume"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "index_id"
  end

  add_index "prices", ["company_id"], name: "index_prices_on_company_id", using: :btree
  add_index "prices", ["date"], name: "index_prices_on_date", using: :btree

end
