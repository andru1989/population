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

ActiveRecord::Schema.define(version: 20150924200313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true, using: :btree
  add_index "cities", ["region_id"], name: "index_cities_on_region_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "last_name",           null: false
    t.integer  "identification_type", null: false
    t.string   "identification",      null: false
    t.string   "address"
    t.integer  "gender"
    t.string   "phone"
    t.integer  "city_id",             null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.hstore   "work_experience"
  end

  add_index "people", ["city_id"], name: "index_people_on_city_id", using: :btree
  add_index "people", ["identification"], name: "index_people_on_identification", unique: true, using: :btree
  add_index "people", ["work_experience"], name: "index_people_on_work_experience", using: :gin

  create_table "regions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "regions", ["name"], name: "index_regions_on_name", unique: true, using: :btree

end
