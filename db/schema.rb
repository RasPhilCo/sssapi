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

ActiveRecord::Schema.define(version: 20140822055518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tags", force: true do |t|
    t.string   "dots"
    t.string   "point1"
    t.string   "point2"
    t.string   "point3"
    t.string   "point4"
    t.string   "point5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["dots"], name: "index_tags_on_dots", using: :btree
  add_index "tags", ["point1"], name: "index_tags_on_point1", using: :btree
  add_index "tags", ["point2"], name: "index_tags_on_point2", using: :btree
  add_index "tags", ["point3"], name: "index_tags_on_point3", using: :btree
  add_index "tags", ["point4"], name: "index_tags_on_point4", using: :btree
  add_index "tags", ["point5"], name: "index_tags_on_point5", using: :btree

end
