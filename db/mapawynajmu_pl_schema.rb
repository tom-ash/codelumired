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

ActiveRecord::Schema.define(version: 2022_04_24_043052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", limit: 2, null: false
    t.integer "points", null: false
    t.integer "views", null: false
    t.jsonb "reports", null: false
    t.boolean "visible", null: false
    t.datetime "active_until", null: false
    t.integer "category", limit: 2, null: false
    t.float "area", null: false
    t.integer "rent_currency", limit: 2
    t.float "net_rent_amount"
    t.float "net_rent_amount_per_sqm"
    t.float "gross_rent_amount"
    t.float "gross_rent_amount_per_sqm"
    t.integer "rooms", limit: 2
    t.integer "floor", limit: 2
    t.integer "total_floors", limit: 2
    t.date "availability_date"
    t.jsonb "pictures", null: false
    t.jsonb "features"
    t.jsonb "furnishings"
    t.text "polish_description"
    t.text "english_description"
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.jsonb "change_log", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "area_int"
    t.integer "net_rent_amount_int"
    t.integer "net_rent_amount_per_sqm_int"
    t.integer "gross_rent_amount_int"
    t.integer "gross_rent_amount_per_sqm_int"
    t.integer "longitude_int"
    t.integer "latitude_int"
    t.boolean "confirmed"
    t.string "locality"
    t.string "sublocality"
    t.index ["active_until"], name: "index_announcements_on_active_until"
    t.index ["area"], name: "index_announcements_on_area"
    t.index ["area_int"], name: "index_announcements_on_area_int"
    t.index ["availability_date"], name: "index_announcements_on_availability_date"
    t.index ["category"], name: "index_announcements_on_category"
    t.index ["confirmed"], name: "index_announcements_on_confirmed"
    t.index ["floor"], name: "index_announcements_on_floor"
    t.index ["gross_rent_amount"], name: "index_announcements_on_gross_rent_amount"
    t.index ["gross_rent_amount_int"], name: "index_announcements_on_gross_rent_amount_int"
    t.index ["gross_rent_amount_per_sqm"], name: "index_announcements_on_gross_rent_amount_per_sqm"
    t.index ["gross_rent_amount_per_sqm_int"], name: "index_announcements_on_gross_rent_amount_per_sqm_int"
    t.index ["latitude"], name: "index_announcements_on_latitude"
    t.index ["latitude_int"], name: "index_announcements_on_latitude_int"
    t.index ["longitude"], name: "index_announcements_on_longitude"
    t.index ["longitude_int"], name: "index_announcements_on_longitude_int"
    t.index ["net_rent_amount"], name: "index_announcements_on_net_rent_amount"
    t.index ["net_rent_amount_int"], name: "index_announcements_on_net_rent_amount_int"
    t.index ["net_rent_amount_per_sqm"], name: "index_announcements_on_net_rent_amount_per_sqm"
    t.index ["net_rent_amount_per_sqm_int"], name: "index_announcements_on_net_rent_amount_per_sqm_int"
    t.index ["points"], name: "index_announcements_on_points"
    t.index ["rent_currency"], name: "index_announcements_on_rent_currency"
    t.index ["rooms"], name: "index_announcements_on_rooms"
    t.index ["status"], name: "index_announcements_on_status"
    t.index ["total_floors"], name: "index_announcements_on_total_floors"
    t.index ["user_id"], name: "index_announcements_on_user_id"
    t.index ["visible"], name: "index_announcements_on_visible"
  end

  create_table "assets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.jsonb "data"
    t.index ["name"], name: "index_assets_on_name", unique: true
  end

  create_table "deleted_announcements", force: :cascade do |t|
    t.jsonb "original_announcement", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deleted_users", force: :cascade do |t|
    t.jsonb "original_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.bigint "added_by_id", null: false
    t.bigint "page_id"
    t.jsonb "body", null: false
    t.string "name"
    t.integer "width"
    t.integer "height"
    t.string "storage_key", null: false
    t.string "storage_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["added_by_id"], name: "index_images_on_added_by_id"
    t.index ["page_id"], name: "index_images_on_page_id"
    t.index ["storage_key"], name: "index_images_on_storage_key", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "lang", null: false
    t.string "name", null: false
    t.string "url", null: false
    t.string "title"
    t.string "keywords"
    t.string "description"
    t.string "style"
    t.jsonb "body", null: false
    t.jsonb "meta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "canonical_url"
    t.string "picture"
    t.boolean "online"
    t.boolean "header_autonumbering"
    t.string "schema_mode", default: "auto", null: false
    t.jsonb "auto_schema", default: {}, null: false
    t.jsonb "manual_schema", default: {}, null: false
    t.date "published_on"
    t.date "modified_on"
    t.index ["author_id"], name: "index_pages_on_author_id"
    t.index ["description"], name: "index_pages_on_description"
    t.index ["keywords"], name: "index_pages_on_keywords"
    t.index ["lang"], name: "index_pages_on_lang"
    t.index ["name", "lang"], name: "index_pages_on_name_and_lang", unique: true
    t.index ["name"], name: "index_pages_on_name"
    t.index ["title"], name: "index_pages_on_title"
    t.index ["url"], name: "index_pages_on_url", unique: true
  end

  create_table "prospective_users", force: :cascade do |t|
    t.string "encrypted_access_token", null: false
    t.jsonb "verification", null: false
    t.string "verification_code_iv", null: false
    t.jsonb "user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encrypted_access_token"], name: "index_prospective_users_on_encrypted_access_token", unique: true
  end

  create_table "redirects", force: :cascade do |t|
    t.bigint "added_by_id", null: false
    t.string "original_url", null: false
    t.string "redirected_url", null: false
    t.integer "status", null: false
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["added_by_id"], name: "index_redirects_on_added_by_id"
    t.index ["original_url"], name: "index_redirects_on_original_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "status", limit: 2, null: false
    t.string "encrypted_access_token", null: false
    t.date "access_token_date", null: false
    t.jsonb "verification"
    t.string "verification_code_iv"
    t.integer "points", null: false
    t.string "email", null: false
    t.string "hashed_password", null: false
    t.string "password_salt", null: false
    t.jsonb "consents", null: false
    t.jsonb "phone", null: false
    t.string "business_name"
    t.jsonb "showcase", null: false
    t.string "legal_name"
    t.string "tax_number"
    t.text "address"
    t.jsonb "change_log", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "account_type"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.boolean "confirmed", default: false, null: false
    t.datetime "email_confirmed_at"
    t.string "country_code"
    t.string "phone_number"
    t.string "encrypted_confirmation_token"
    t.datetime "confirmation_token_generated_at", precision: 6
    t.index ["confirmed"], name: "index_users_on_confirmed"
    t.index ["country_code"], name: "index_users_on_country_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_confirmed_at"], name: "index_users_on_email_confirmed_at"
    t.index ["encrypted_access_token"], name: "index_users_on_encrypted_access_token", unique: true
    t.index ["encrypted_confirmation_token"], name: "index_users_on_encrypted_confirmation_token"
    t.index ["phone_number"], name: "index_users_on_phone_number"
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "announcements", "users"
  add_foreign_key "images", "users", column: "added_by_id"
  add_foreign_key "pages", "users", column: "author_id"
  add_foreign_key "redirects", "users", column: "added_by_id"
end
