# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_03_152834) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "en", null: false
    t.string "pl", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.bigint "added_by_id", null: false
    t.bigint "page_id"
    t.jsonb "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "width"
    t.integer "height"
    t.string "storage_key", null: false
    t.string "storage_url"
    t.index ["added_by_id"], name: "index_images_on_added_by_id"
    t.index ["page_id"], name: "index_images_on_page_id"
    t.index ["storage_key"], name: "index_images_on_storage_key", unique: true
  end

  create_table "pages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "lang", null: false
    t.string "url", null: false
    t.string "canonical_url"
    t.jsonb "body", null: false
    t.string "title"
    t.string "keywords"
    t.string "description"
    t.string "cover_image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "author_id"
    t.boolean "online"
    t.boolean "header_autonumbering"
    t.string "schema_mode", default: "auto", null: false
    t.jsonb "auto_schema", default: {}, null: false
    t.jsonb "manual_schema", default: {}, null: false
    t.date "published_on"
    t.date "modified_on"
    t.string "category"
    t.string "subcategory"
    t.uuid "lang_alts_group"
    t.string "link_image"
    t.datetime "index_now_pinged_at", precision: nil
    t.uuid "parent_id"
    t.integer "priority", limit: 2
    t.uuid "category_id"
    t.index ["category_id"], name: "index_pages_on_category_id"
    t.index ["parent_id"], name: "index_pages_on_parent_id"
  end

  create_table "postings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "views", null: false
    t.string "company_name", null: false
    t.integer "company_size", null: false
    t.boolean "remote", null: false
    t.boolean "hybrid", null: false
    t.boolean "office", null: false
    t.string "country", null: false
    t.string "locality", null: false
    t.string "sublocality"
    t.string "street"
    t.boolean "employment", null: false
    t.boolean "b2b", null: false
    t.integer "employment_min"
    t.integer "employment_max"
    t.integer "b2b_min"
    t.integer "b2b_max"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_postings_on_user_id"
  end

  create_table "question_answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "question_id", null: false
    t.string "sequence_letter", null: false
    t.string "body", null: false
    t.boolean "is_correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "lang", null: false
    t.string "question_type", null: false
    t.string "url", null: false
    t.string "title", null: false
    t.string "body", null: false
    t.string "hint", null: false
    t.string "explanation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "category_id", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["url"], name: "index_questions_on_url", unique: true
  end

  create_table "redirects", force: :cascade do |t|
    t.bigint "added_by_id", null: false
    t.string "original_url", null: false
    t.string "redirected_url", null: false
    t.integer "status", null: false
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_redirects_on_added_by_id"
    t.index ["original_url"], name: "index_redirects_on_original_url", unique: true
  end

  create_table "selected_skills", force: :cascade do |t|
    t.bigint "posting_id", null: false
    t.bigint "skill_id", null: false
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level"], name: "index_selected_skills_on_level"
    t.index ["posting_id"], name: "index_selected_skills_on_posting_id"
    t.index ["skill_id"], name: "index_selected_skills_on_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "principal_skill_id"
    t.string "name", null: false
    t.string "type", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_skills_on_name", unique: true
    t.index ["principal_skill_id"], name: "index_skills_on_principal_skill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "role"
    t.string "account_type"
    t.string "first_name"
    t.string "last_name"
    t.string "hashed_password", null: false
    t.string "password_salt", null: false
    t.jsonb "change_log", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "email_verified_at", precision: nil
    t.datetime "deleted_at"
    t.jsonb "author_data"
  end

  add_foreign_key "images", "users", column: "added_by_id"
  add_foreign_key "pages", "categories"
  add_foreign_key "pages", "pages", column: "parent_id"
  add_foreign_key "pages", "users", column: "author_id"
  add_foreign_key "postings", "users"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "redirects", "users", column: "added_by_id"
  add_foreign_key "selected_skills", "postings"
  add_foreign_key "selected_skills", "skills"
  add_foreign_key "skills", "skills", column: "principal_skill_id"
end
