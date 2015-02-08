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

ActiveRecord::Schema.define(version: 20150208064634) do

  create_table "barista_voices", force: true do |t|
    t.string   "situation"
    t.string   "voice"
    t.string   "voice_attribute"
    t.string   "counter_voice_attribute"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_voices", force: true do |t|
    t.string   "situation"
    t.string   "voice"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "voice_attribute"
    t.string   "counter_voice_attribute"
  end

  create_table "menu_details", force: true do |t|
    t.integer  "menu_id"
    t.integer  "product_id"
    t.string   "recommended"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_details", ["menu_id"], name: "index_menu_details_on_menu_id"
  add_index "menu_details", ["product_id"], name: "index_menu_details_on_product_id"

  create_table "menus", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "limited"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
