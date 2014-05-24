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

ActiveRecord::Schema.define(version: 20140524103936) do

  create_table "administrators", force: true do |t|
    t.integer  "adminId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["adminId"], name: "index_administrators_on_adminId", unique: true

  create_table "administrators_clubs", id: false, force: true do |t|
    t.integer "administrator_id"
    t.integer "club_id"
  end

  create_table "announcements", force: true do |t|
    t.integer  "club_id"
    t.integer  "user_id"
    t.string   "message"
    t.boolean  "admintoggle"
    t.boolean  "membertoggle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "club_announcements", force: true do |t|
    t.text     "content"
    t.integer  "club_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "club_registration_requests", force: true do |t|
    t.integer  "registrationId"
    t.integer  "clubId"
    t.datetime "registrationDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.integer  "clubId"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.boolean  "approved"
    t.string   "description"
  end

  create_table "clubs_followers", id: false, force: true do |t|
    t.integer "club_id"
    t.integer "follower_id"
  end

  create_table "clubs_shared_events", id: false, force: true do |t|
    t.integer "club_id"
    t.integer "shared_event_id"
  end

  create_table "clubs_users", id: false, force: true do |t|
    t.integer "club_id"
    t.integer "user_id"
  end

  create_table "discussion_posts", force: true do |t|
    t.text     "contents"
    t.integer  "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.boolean  "memberOnly"
    t.datetime "date"
    t.string   "place"
    t.float    "price"
    t.string   "website"
    t.string   "salesLocation"
    t.string   "description"
    t.string   "termsConditions"
    t.integer  "total_tickets"
    t.integer  "remaining_tickets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
  end

  create_table "followers", force: true do |t|
    t.string   "followId"
    t.string   "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followers", ["followId"], name: "index_followers_on_followId", unique: true

  create_table "reserve_tickets", force: true do |t|
    t.integer  "users_id"
    t.integer  "events_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "ticket_nums"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shared_events", force: true do |t|
    t.integer  "eventId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shared_events", ["eventId"], name: "index_shared_events_on_eventId", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "csadmin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
