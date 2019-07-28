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

ActiveRecord::Schema.define(version: 2019_05_04_073723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "active"
    t.integer "points"
    t.integer "views"
    t.jsonb "reports"
    t.date "refreshed_at"
    t.integer "category"
    t.integer "district"
    t.integer "rent_currency"
    t.integer "rent_amount"
    t.boolean "additional_fees"
    t.integer "area"
    t.date "availability_date"
    t.integer "rooms"
    t.integer "floor"
    t.integer "total_floors"
    t.jsonb "pictures"
    t.jsonb "features"
    t.jsonb "furnishings"
    t.text "polish_description"
    t.text "english_description"
    t.integer "map_longitude"
    t.integer "map_latitude"
    t.jsonb "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_announcements_on_active"
    t.index ["additional_fees"], name: "index_announcements_on_additional_fees"
    t.index ["area"], name: "index_announcements_on_area"
    t.index ["availability_date"], name: "index_announcements_on_availability_date"
    t.index ["category"], name: "index_announcements_on_category"
    t.index ["district"], name: "index_announcements_on_district"
    t.index ["floor"], name: "index_announcements_on_floor"
    t.index ["map_latitude"], name: "index_announcements_on_map_latitude"
    t.index ["map_longitude"], name: "index_announcements_on_map_longitude"
    t.index ["points"], name: "index_announcements_on_points"
    t.index ["refreshed_at"], name: "index_announcements_on_refreshed_at"
    t.index ["rent_amount"], name: "index_announcements_on_rent_amount"
    t.index ["rent_currency"], name: "index_announcements_on_rent_currency"
    t.index ["rooms"], name: "index_announcements_on_rooms"
    t.index ["total_floors"], name: "index_announcements_on_total_floors"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "deleted_user_ciphers", force: :cascade do |t|
    t.jsonb "original_user_cipher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deleted_users", force: :cascade do |t|
    t.jsonb "original_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "derived_ciphers", force: :cascade do |t|
    t.string "iv"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospective_user_ciphers", force: :cascade do |t|
    t.string "verification_code_iv"
    t.jsonb "user_cipher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospective_users", force: :cascade do |t|
    t.string "encrypted_search_token"
    t.jsonb "verification"
    t.jsonb "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ciphers", force: :cascade do |t|
    t.string "access_token_salt"
    t.string "verification_code_iv"
    t.integer "email_derived_cipher_id"
    t.string "password_salt"
    t.string "phone_body_iv"
    t.string "business_name_iv"
    t.string "tax_identification_iv"
    t.string "invoice_data_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "status"
    t.string "encrypted_search_token"
    t.string "hashed_access_token"
    t.jsonb "verification"
    t.string "encrypted_email"
    t.string "hashed_password"
    t.jsonb "consents"
    t.integer "points"
    t.jsonb "phone"
    t.string "encrypted_business_name"
    t.string "encrypted_tax_identification"
    t.jsonb "showcase"
    t.text "encrypted_invoice_data"
    t.jsonb "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encrypted_email"], name: "index_users_on_encrypted_email"
    t.index ["encrypted_search_token"], name: "index_users_on_encrypted_search_token"
  end

  add_foreign_key "announcements", "users"
end
