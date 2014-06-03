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

ActiveRecord::Schema.define(version: 20140602205216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "directors", ["slug"], name: "index_directors_on_slug", unique: true, using: :btree

  create_table "media", force: true do |t|
    t.integer  "video_id"
    t.string   "direct_upload_url"
    t.boolean  "processed"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "videos", force: true do |t|
    t.integer  "director_id"
    t.string   "title"
    t.string   "client"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree

end
