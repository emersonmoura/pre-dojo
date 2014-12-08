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

ActiveRecord::Schema.define(version: 20141207190806) do

  create_table "gamers", force: true do |t|
    t.string   "name"
    t.integer  "killings"
    t.integer  "deaths"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamers", ["round_id"], name: "index_gamers_on_round_id"

  create_table "rankings", force: true do |t|
    t.integer  "round_id"
    t.integer  "gamer_id"
    t.integer  "killings"
    t.integer  "deaths"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rankings", ["gamer_id"], name: "index_rankings_on_gamer_id"
  add_index "rankings", ["round_id"], name: "index_rankings_on_round_id"

  create_table "rounds", force: true do |t|
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
