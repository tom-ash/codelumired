# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_17_075012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", limit: 2, null: false
    t.integer "points", null: false
    t.integer "views", null: false
    t.jsonb "reports", null: false
    t.boolean "visible", null: false
    t.date "active_until", null: false
    t.integer "category", limit: 2, null: false
    t.integer "district", limit: 2, null: false
    t.integer "area", null: false
    t.integer "rent_currency", limit: 2, null: false
    t.integer "net_rent_amount", null: false
    t.integer "net_rent_amount_per_sqm", null: false
    t.integer "gross_rent_amount", null: false
    t.integer "gross_rent_amount_per_sqm", null: false
    t.integer "rooms", limit: 2, null: false
    t.integer "floor", limit: 2, null: false
    t.integer "total_floors", limit: 2, null: false
    t.date "availability_date", null: false
    t.jsonb "pictures", null: false
    t.jsonb "features", null: false
    t.jsonb "furnishings", null: false
    t.text "polish_description", null: false
    t.text "english_description", null: false
    t.integer "longitude", null: false
    t.integer "latitude", null: false
    t.jsonb "change_log", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active_until"], name: "index_announcements_on_active_until"
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
    t.index ["rent_currency"], name: "index_announcements_on_rent_currency"
    t.index ["rooms"], name: "index_announcements_on_rooms"
    t.index ["status"], name: "index_announcements_on_status"
    t.index ["total_floors"], name: "index_announcements_on_total_floors"
    t.index ["user_id"], name: "index_announcements_on_user_id"
    t.index ["visible"], name: "index_announcements_on_visible"
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

  create_table "prospective_users", force: :cascade do |t|
    t.string "encrypted_access_token", null: false
    t.jsonb "verification", null: false
    t.string "verification_code_iv", null: false
    t.jsonb "user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encrypted_access_token"], name: "index_prospective_users_on_encrypted_access_token", unique: true
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
    t.string "business_name", null: false
    t.jsonb "showcase", null: false
    t.string "legal_name", null: false
    t.string "tax_number", null: false
    t.text "address", null: false
    t.jsonb "change_log", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["encrypted_access_token"], name: "index_users_on_encrypted_access_token", unique: true
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "announcements", "users"
end
