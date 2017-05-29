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

ActiveRecord::Schema.define(version: 20170526002953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_rosters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "status"
    t.boolean  "approved"
    t.string   "approved_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_event_rosters_on_event_id", using: :btree
    t.index ["user_id"], name: "index_event_rosters_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "start"
    t.datetime "end"
    t.integer  "total_needed"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "certification"
    t.string   "cert_state"
    t.string   "role"
    t.string   "call_sign"
    t.string   "emergency_name"
    t.string   "emergency_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "sms_notifications", force: :cascade do |t|
    t.string   "to"
    t.string   "from"
    t.string   "body"
    t.boolean  "sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "response"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "event_rosters", "events"
  add_foreign_key "event_rosters", "users"
end
