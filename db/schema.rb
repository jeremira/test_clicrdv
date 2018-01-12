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

ActiveRecord::Schema.define(version: 20180112165004) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "calendar_id",     limit: 4
    t.integer  "intervention_id", limit: 4
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "customer_name",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "interventions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "duration",    limit: 4
    t.integer  "price",       limit: 4
    t.integer  "calendar_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "openings", force: :cascade do |t|
    t.integer  "calendar_id", limit: 4
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
