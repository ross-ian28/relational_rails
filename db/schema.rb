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

ActiveRecord::Schema.define(version: 2022_03_24_161228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ferrets", force: :cascade do |t|
    t.string "name"
    t.boolean "hungry"
    t.integer "snack_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.boolean "ferret_safe"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ferret_id"
    t.index ["ferret_id"], name: "index_snacks_on_ferret_id"
  end

  add_foreign_key "snacks", "ferrets"
end
