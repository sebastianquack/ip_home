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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130106132131) do

  create_table "events", :force => true do |t|
    t.date     "date"
    t.time     "time"
    t.string   "location_en"
    t.string   "location_de"
    t.string   "title_en"
    t.string   "title_de"
    t.text     "description_en"
    t.text     "description_de"
    t.string   "url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "image_width"
    t.integer  "image_height"
  end

  create_table "map_positions", :force => true do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "media_items", :force => true do |t|
    t.string   "source"
    t.date     "date"
    t.text     "quote"
    t.string   "url"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "project_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "title_en"
    t.string   "slug"
    t.text     "content_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title_de"
    t.text     "content_de"
    t.decimal  "in_menu"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "title_en"
    t.string   "title_de"
    t.string   "slug"
    t.text     "description_short_en"
    t.text     "description_short_de"
    t.text     "description_long_en"
    t.text     "description_long_de"
    t.string   "location"
    t.string   "year"
    t.string   "client"
    t.string   "website"
    t.integer  "in_gallery"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "image_id"
  end

  create_table "projects_tags", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "tag_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name_en"
    t.string   "name_de"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
