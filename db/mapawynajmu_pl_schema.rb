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

ActiveRecord::Schema[7.0].define(version: 2023_07_28_064759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.jsonb "data"
    t.string "path_data"
    t.string "view_box"
    t.index ["name"], name: "index_assets_on_name", unique: true
  end

  create_table "deleted_announcements", force: :cascade do |t|
    t.jsonb "original_announcement", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deleted_users", force: :cascade do |t|
    t.jsonb "original_user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_images_on_added_by_id"
    t.index ["page_id"], name: "index_images_on_page_id"
    t.index ["storage_key"], name: "index_images_on_storage_key", unique: true
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", limit: 2, null: false
    t.integer "points", null: false
    t.integer "views", null: false
    t.jsonb "reports", null: false
    t.boolean "visible", null: false
    t.datetime "active_until", precision: nil, null: false
    t.integer "category", limit: 2, null: false
    t.float "area"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_int"
    t.integer "net_rent_amount_int"
    t.integer "net_rent_amount_per_sqm_int"
    t.integer "gross_rent_amount_int"
    t.integer "gross_rent_amount_per_sqm_int"
    t.integer "longitude_int"
    t.integer "latitude_int"
    t.boolean "user_verified"
    t.string "locality"
    t.string "sublocality"
    t.string "name"
    t.string "link"
    t.bigint "admin_id"
    t.boolean "is_promoted", default: false, null: false
    t.datetime "deleted_at"
    t.index ["active_until"], name: "index_listings_on_active_until"
    t.index ["admin_id"], name: "index_listings_on_admin_id"
    t.index ["area"], name: "index_listings_on_area"
    t.index ["area_int"], name: "index_listings_on_area_int"
    t.index ["availability_date"], name: "index_listings_on_availability_date"
    t.index ["category"], name: "index_listings_on_category"
    t.index ["floor"], name: "index_listings_on_floor"
    t.index ["gross_rent_amount"], name: "index_listings_on_gross_rent_amount"
    t.index ["gross_rent_amount_int"], name: "index_listings_on_gross_rent_amount_int"
    t.index ["gross_rent_amount_per_sqm"], name: "index_listings_on_gross_rent_amount_per_sqm"
    t.index ["gross_rent_amount_per_sqm_int"], name: "index_listings_on_gross_rent_amount_per_sqm_int"
    t.index ["latitude"], name: "index_listings_on_latitude"
    t.index ["latitude_int"], name: "index_listings_on_latitude_int"
    t.index ["longitude"], name: "index_listings_on_longitude"
    t.index ["longitude_int"], name: "index_listings_on_longitude_int"
    t.index ["net_rent_amount"], name: "index_listings_on_net_rent_amount"
    t.index ["net_rent_amount_int"], name: "index_listings_on_net_rent_amount_int"
    t.index ["net_rent_amount_per_sqm"], name: "index_listings_on_net_rent_amount_per_sqm"
    t.index ["net_rent_amount_per_sqm_int"], name: "index_listings_on_net_rent_amount_per_sqm_int"
    t.index ["points"], name: "index_listings_on_points"
    t.index ["rent_currency"], name: "index_listings_on_rent_currency"
    t.index ["rooms"], name: "index_listings_on_rooms"
    t.index ["status"], name: "index_listings_on_status"
    t.index ["total_floors"], name: "index_listings_on_total_floors"
    t.index ["user_id"], name: "index_listings_on_user_id"
    t.index ["user_verified"], name: "index_listings_on_user_verified"
    t.index ["visible"], name: "index_listings_on_visible"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "announcement_id", null: false
    t.string "payu_order_id", null: false
    t.string "payu_merchant_pos_id", null: false
    t.string "status", null: false
    t.datetime "paid_at"
    t.string "product", null: false
    t.string "price", null: false
    t.integer "quantity", null: false
    t.string "currency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_orders_on_announcement_id"
    t.index ["payu_order_id"], name: "index_orders_on_payu_order_id", unique: true
  end

  create_table "pages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "lang", null: false
    t.string "url", null: false
    t.string "title"
    t.string "keywords"
    t.string "description"
    t.jsonb "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "canonical_url"
    t.string "cover_image"
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
    t.datetime "index_now_pinged_at"
    t.index ["author_id"], name: "index_pages_on_author_id"
    t.index ["category"], name: "index_pages_on_category"
    t.index ["description"], name: "index_pages_on_description"
    t.index ["keywords"], name: "index_pages_on_keywords"
    t.index ["lang"], name: "index_pages_on_lang"
    t.index ["lang_alts_group"], name: "index_pages_on_lang_alts_group"
    t.index ["subcategory"], name: "index_pages_on_subcategory"
    t.index ["title"], name: "index_pages_on_title"
    t.index ["url"], name: "index_pages_on_url", unique: true
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

  create_table "users", force: :cascade do |t|
    t.integer "status", limit: 2, null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_type"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "email_verified_at", precision: nil
    t.string "country_code"
    t.string "phone_number"
    t.string "urlified_business_name"
    t.datetime "deleted_at"
    t.index ["country_code"], name: "index_users_on_country_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_verified_at"], name: "index_users_on_email_verified_at"
    t.index ["phone_number"], name: "index_users_on_phone_number"
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "images", "users", column: "added_by_id"
  add_foreign_key "listings", "users"
  add_foreign_key "listings", "users", column: "admin_id"
  add_foreign_key "orders", "listings", column: "announcement_id"
  add_foreign_key "pages", "users", column: "author_id"
  add_foreign_key "redirects", "users", column: "added_by_id"
end
