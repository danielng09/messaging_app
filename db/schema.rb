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

ActiveRecord::Schema.define(version: 20150902185507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversation_participants", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "conversation_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "conversation_participants", ["user_id", "conversation_id"], name: "index_conversation_participants_on_user_id_and_conversation_id", unique: true, using: :btree

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject",         null: false
    t.text     "body",            null: false
    t.integer  "conversation_id", null: false
    t.integer  "from_id",         null: false
    t.integer  "to_id",           null: false
    t.boolean  "active",          null: false
    t.boolean  "read",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["active"], name: "index_messages_on_active", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["read"], name: "index_messages_on_read", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.boolean  "homeowner",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
