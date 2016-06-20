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

ActiveRecord::Schema.define(version: 20160620202444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_tags", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "country_tags", ["country_id"], name: "index_country_tags_on_country_id", using: :btree
  add_index "country_tags", ["tag_id"], name: "index_country_tags_on_tag_id", using: :btree

  create_table "indicator_tags", force: :cascade do |t|
    t.integer  "indicator_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "indicator_tags", ["indicator_id"], name: "index_indicator_tags_on_indicator_id", using: :btree
  add_index "indicator_tags", ["tag_id"], name: "index_indicator_tags_on_tag_id", using: :btree

  create_table "indicators", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preview_tags", force: :cascade do |t|
    t.integer  "preview_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "preview_tags", ["preview_id"], name: "index_preview_tags_on_preview_id", using: :btree
  add_index "preview_tags", ["tag_id"], name: "index_preview_tags_on_tag_id", using: :btree

  create_table "previews", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_tags", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topic_tags", ["tag_id"], name: "index_topic_tags_on_tag_id", using: :btree
  add_index "topic_tags", ["topic_id"], name: "index_topic_tags_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "country_tags", "countries"
  add_foreign_key "country_tags", "tags"
  add_foreign_key "indicator_tags", "indicators"
  add_foreign_key "indicator_tags", "tags"
  add_foreign_key "preview_tags", "previews"
  add_foreign_key "preview_tags", "tags"
  add_foreign_key "topic_tags", "tags"
  add_foreign_key "topic_tags", "topics"
end
