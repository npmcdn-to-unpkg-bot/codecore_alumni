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

ActiveRecord::Schema.define(version: 20160710201123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.string   "image"
    t.text     "description"
    t.string   "school_url"
    t.string   "degree"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "from_date"
    t.date     "to_date"
  end

  add_index "educations", ["profile_id"], name: "index_educations_on_profile_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "job_title"
    t.text     "description"
    t.string   "company_url"
    t.string   "image"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "profile_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "company_name"
  end

  add_index "experiences", ["profile_id"], name: "index_experiences_on_profile_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_name"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "tagline"
    t.text     "description"
    t.boolean  "availability", default: false
    t.string   "resume"
    t.string   "photo"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "twitter_url"
    t.string   "linkedin_url"
    t.string   "github_url"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "project_url"
    t.string   "github_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  add_index "projects", ["profile_id"], name: "index_projects_on_profile_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
    t.integer  "proficiency"
  end

  add_index "skills", ["category_id"], name: "index_skills_on_category_id", using: :btree
  add_index "skills", ["profile_id"], name: "index_skills_on_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "approved",               default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "educations", "profiles"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "profiles"
  add_foreign_key "skills", "categories"
  add_foreign_key "skills", "profiles"
end
