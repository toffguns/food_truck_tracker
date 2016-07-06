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

ActiveRecord::Schema.define(version: 20160706184257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trucks", force: :cascade do |t|
    t.string   "name"
    t.text     "cuisine"
    t.text     "menu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  create_table "time_and_places", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
  end

end
