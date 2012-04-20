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

ActiveRecord::Schema.define(:version => 20120420183215) do

  create_table "requests", :force => true do |t|
    t.integer  "remote_id"
    t.string   "token"
    t.string   "status"
    t.string   "service_name"
    t.integer  "service_id"
    t.text     "description"
    t.string   "city_update_datetime"
    t.string   "requested_datetime"
    t.string   "address"
    t.string   "lat"
    t.string   "long"
    t.string   "media_url"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_remote_url"
  end

  create_table "users", :force => true do |t|
    t.integer  "remote_id"
    t.string   "token"
    t.string   "display_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
