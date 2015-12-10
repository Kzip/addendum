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

ActiveRecord::Schema.define(version: 20151028021017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addendums", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "addendum_file_name"
    t.string   "addendum_content_type"
    t.integer  "addendum_file_size"
    t.datetime "addendum_updated_at"
    t.integer  "podcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addendums", ["podcast_id"], name: "index_addendums_on_podcast_id", using: :btree

  create_table "podcasts", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "cast_file_name"
    t.string   "cast_content_type"
    t.integer  "cast_file_size"
    t.datetime "cast_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "podpage_id"
  end

  add_index "podcasts", ["podpage_id"], name: "index_podcasts_on_podpage_id", using: :btree

  create_table "podpages", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "podpage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["podpage_id"], name: "index_subscriptions_on_podpage_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
