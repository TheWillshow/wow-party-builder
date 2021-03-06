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

ActiveRecord::Schema.define(version: 20160428173030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guildmembers", force: :cascade do |t|
    t.string   "member_name",                  null: false
    t.integer  "character_class",              null: false
    t.integer  "level",                        null: false
    t.string   "spec",            default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guild_id",                     null: false
  end

  create_table "guilds", force: :cascade do |t|
    t.string   "guild_name", null: false
    t.string   "realm",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "partymembers", force: :cascade do |t|
    t.integer "party_id"
    t.integer "guildmember_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uid",                 default: "", null: false
    t.string   "battletag",           default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  add_foreign_key "guildmembers", "guilds"
  add_foreign_key "parties", "users"
  add_foreign_key "partymembers", "guildmembers"
  add_foreign_key "partymembers", "parties"
end
