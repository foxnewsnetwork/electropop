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

ActiveRecord::Schema.define(version: 20140523052535) do

  create_table "elect_external_links", force: true do |t|
    t.integer  "project_id"
    t.string   "href"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elect_external_links", ["project_id"], name: "index_elect_external_links_on_project_id", using: :btree

  create_table "elect_frameworks", force: true do |t|
    t.integer  "project_id"
    t.string   "framework_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elect_frameworks", ["project_id"], name: "index_elect_frameworks_on_project_id", using: :btree

  create_table "elect_languages", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elect_languages", ["project_id"], name: "index_elect_languages_on_project_id", using: :btree

  create_table "elect_pictures", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "elect_pictures", ["project_id"], name: "index_elect_pictures_on_project_id", using: :btree

  create_table "elect_projects", force: true do |t|
    t.string   "permalink"
    t.string   "title"
    t.string   "tagline"
    t.text     "description"
    t.string   "purpose"
    t.string   "project_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
