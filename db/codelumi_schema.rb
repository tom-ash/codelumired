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

ActiveRecord::Schema.define(version: 2021_03_17_073242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.string "name", null: false
    t.string "lang", null: false
    t.string "url", null: false
    t.string "canonical_url"
    t.jsonb "body", null: false
    t.string "styles"
    t.string "title"
    t.string "keywords"
    t.string "description"
    t.string "picture"
    t.string "style"
    t.jsonb "meta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_pages_on_description"
    t.index ["keywords"], name: "index_pages_on_keywords"
    t.index ["lang"], name: "index_pages_on_lang"
    t.index ["name"], name: "index_pages_on_name"
    t.index ["title"], name: "index_pages_on_title"
    t.index ["url"], name: "index_pages_on_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "status", limit: 2, null: false
    t.string "email", null: false
    t.string "role"
    t.string "account_type"
    t.string "first_name"
    t.string "last_name"
    t.string "encrypted_access_token", null: false
    t.date "access_token_date", null: false
    t.jsonb "verification"
    t.string "verification_code_iv"
    t.string "hashed_password", null: false
    t.string "password_salt", null: false
    t.jsonb "consents", null: false
    t.jsonb "change_log", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
