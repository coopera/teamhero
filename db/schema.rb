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

ActiveRecord::Schema.define(version: 20160430032102) do

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "badges_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "badge_id"
  end

  add_index "badges_users", ["badge_id"], name: "index_badges_users_on_badge_id"
  add_index "badges_users", ["user_id"], name: "index_badges_users_on_user_id"

  create_table "scores", force: :cascade do |t|
    t.integer  "badge_type"
    t.integer  "points"
    t.integer  "user_id"
    t.integer  "score_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scores", ["user_id"], name: "index_scores_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "avatar"
    t.string   "name"
    t.string   "token"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
