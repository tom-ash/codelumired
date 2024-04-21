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

ActiveRecord::Schema[7.0].define(version: 2024_01_01_103316) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "type"
    t.jsonb "data"
    t.string "path_data"
    t.string "view_box"
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", limit: 2, null: false
    t.integer "points", null: false
    t.integer "views", null: false
    t.jsonb "reports", null: false
    t.boolean "visible", null: false
    t.datetime "active_until", precision: nil
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "deleted_at", precision: nil
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "announcement_id", null: false
    t.string "payu_order_id", null: false
    t.string "payu_merchant_pos_id", null: false
    t.string "status", null: false
    t.datetime "paid_at", precision: nil
    t.string "product", null: false
    t.string "price", null: false
    t.integer "quantity", null: false
    t.string "currency", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "lang", null: false
    t.string "url", null: false
    t.string "title"
    t.string "keywords"
    t.string "description"
    t.jsonb "body", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "canonical_url"
    t.string "cover_image"
    t.boolean "online"
    t.boolean "header_autonumbering"
    t.string "schema_mode", default: "auto", null: false
    t.jsonb "auto_schema", default: {}, null: false
    t.jsonb "manual_schema", default: {}, null: false
    t.date "published_on"
    t.date "modified_on"
    t.uuid "lang_alts_group"
    t.string "link_image"
    t.datetime "index_now_pinged_at", precision: nil
    t.uuid "parent_id"
    t.integer "priority", limit: 2
    t.string "content_type"
  end

  create_table "redirects", force: :cascade do |t|
    t.bigint "added_by_id", null: false
    t.string "original_url", null: false
    t.string "redirected_url", null: false
    t.integer "status", null: false
    t.text "reason"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "account_type"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "email_verified_at", precision: nil
    t.string "country_code"
    t.string "phone_number"
    t.string "urlified_business_name"
    t.datetime "deleted_at", precision: nil
    t.jsonb "author_data"
  end

  add_foreign_key "images", "users", column: "added_by_id", name: "images_added_by_id_fkey"
  add_foreign_key "listings", "users", column: "admin_id", name: "listings_admin_id_fkey"
  add_foreign_key "listings", "users", name: "listings_user_id_fkey"
  add_foreign_key "orders", "listings", column: "announcement_id", name: "orders_announcement_id_fkey"
  add_foreign_key "pages", "pages", column: "parent_id"
  add_foreign_key "pages", "users", column: "author_id"
  add_foreign_key "redirects", "users", column: "added_by_id", name: "redirects_added_by_id_fkey"
end
