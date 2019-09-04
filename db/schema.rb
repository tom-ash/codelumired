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

ActiveRecord::Schema.define(version: 2019_09_07_082228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", limit: 2, null: false
    t.integer "points", null: false
    t.integer "views", null: false
    t.jsonb "reports", null: false
    t.date "refreshed_at", null: false
    t.integer "category", limit: 2, null: false
    t.integer "district", limit: 2, null: false
    t.integer "rent_currency", limit: 2, null: false
    t.integer "net_rent_amount", null: false
    t.integer "net_rent_amount_per_sqm", null: false
    t.integer "gross_rent_amount", null: false
    t.integer "gross_rent_amount_per_sqm", null: false
    t.boolean "additional_fees", null: false
    t.integer "area", null: false
    t.date "availability_date", null: false
    t.integer "rooms", limit: 2, null: false
    t.integer "floor", limit: 2, null: false
    t.integer "total_floors", limit: 2, null: false
    t.jsonb "pictures", null: false
    t.jsonb "features", null: false
    t.jsonb "furnishings", null: false
    t.text "polish_description", null: false
    t.text "english_description", null: false
    t.integer "longitude", null: false
    t.integer "latitude", null: false
    t.jsonb "history", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_fees"], name: "index_announcements_on_additional_fees"
    t.index ["area"], name: "index_announcements_on_area"
    t.index ["availability_date"], name: "index_announcements_on_availability_date"
    t.index ["category"], name: "index_announcements_on_category"
    t.index ["district"], name: "index_announcements_on_district"
    t.index ["floor"], name: "index_announcements_on_floor"
    t.index ["gross_rent_amount"], name: "index_announcements_on_gross_rent_amount"
    t.index ["gross_rent_amount_per_sqm"], name: "index_announcements_on_gross_rent_amount_per_sqm"
    t.index ["latitude"], name: "index_announcements_on_latitude"
    t.index ["longitude"], name: "index_announcements_on_longitude"
    t.index ["net_rent_amount"], name: "index_announcements_on_net_rent_amount"
    t.index ["net_rent_amount_per_sqm"], name: "index_announcements_on_net_rent_amount_per_sqm"
    t.index ["points"], name: "index_announcements_on_points"
    t.index ["refreshed_at"], name: "index_announcements_on_refreshed_at"
    t.index ["rent_currency"], name: "index_announcements_on_rent_currency"
    t.index ["rooms"], name: "index_announcements_on_rooms"
    t.index ["status"], name: "index_announcements_on_status"
    t.index ["total_floors"], name: "index_announcements_on_total_floors"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "deleted_announcements", force: :cascade do |t|
    t.jsonb "original_announcement", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deleted_user_ciphers", force: :cascade do |t|
    t.jsonb "original_user_cipher", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deleted_users", force: :cascade do |t|
    t.jsonb "original_user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "derived_ciphers", force: :cascade do |t|
    t.string "iv", null: false
    t.string "salt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospective_user_ciphers", force: :cascade do |t|
    t.string "verification_code_iv", null: false
    t.jsonb "user_cipher", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospective_users", force: :cascade do |t|
    t.string "encrypted_search_token", null: false
    t.jsonb "verification", null: false
    t.jsonb "user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ciphers", force: :cascade do |t|
    t.string "access_token_salt", null: false
    t.string "verification_code_iv", null: false
    t.integer "email_derived_cipher_id", null: false
    t.string "password_salt", null: false
    t.string "phone_body_iv", null: false
    t.string "business_name_iv", null: false
    t.string "tax_identification_iv", null: false
    t.string "legal_name_iv", null: false
    t.string "address_iv", null: false
    t.jsonb "history", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "status", limit: 2, null: false
    t.string "encrypted_search_token", null: false
    t.string "hashed_access_token", null: false
    t.date "tokens_date", null: false
    t.jsonb "verification", null: false
    t.integer "points", null: false
    t.string "encrypted_email", null: false
    t.string "hashed_password", null: false
    t.jsonb "consents", null: false
    t.jsonb "phone", null: false
    t.string "encrypted_business_name", null: false
    t.jsonb "showcase", null: false
    t.string "encrypted_tax_identification", null: false
    t.string "encrypted_legal_name", null: false
    t.text "encrypted_address", null: false
    t.jsonb "history", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encrypted_email"], name: "index_users_on_encrypted_email"
    t.index ["encrypted_search_token"], name: "index_users_on_encrypted_search_token"
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "announcements", "users"
end
