# frozen_string_literal: true

FactoryBot.define do
  factory :mapawynajmu_pl_listing, class: ::MapawynajmuPl::Listing do
    user { create(:mapawynajmu_pl_user) }

    status { 1 }
    points { 0 }
    views { 0 }
    reports { [] }
    visible { true }
    active_until { Time.now }
    category { 0 }
    pictures { [{ database: 'test_test_test' }] }
    longitude { 16.432166 }
    latitude { 50.9129256 }
    change_log { [] }

    # t.float "area"
    # t.integer "rent_currency", limit: 2
    # t.float "net_rent_amount"
    # t.float "net_rent_amount_per_sqm"
    # t.float "gross_rent_amount"
    # t.float "gross_rent_amount_per_sqm"
    # t.integer "rooms", limit: 2
    # t.integer "floor", limit: 2
    # t.integer "total_floors", limit: 2
    # t.date "availability_date"
    # t.jsonb "features"
    # t.jsonb "furnishings"
    # t.text "polish_description"
    # t.text "english_description"
    # t.integer "area_int"
    # t.integer "net_rent_amount_int"
    # t.integer "net_rent_amount_per_sqm_int"
    # t.integer "gross_rent_amount_int"
    # t.integer "gross_rent_amount_per_sqm_int"
    # t.integer "longitude_int"
    # t.integer "latitude_int"
    # t.boolean "user_verified"
    # t.string "locality"
    # t.string "sublocality"
    # t.string "name"
    # t.string "link"
    # t.bigint "admin_id"
    # t.datetime "deleted_at"
    # t.boolean "is_promoted", default: false, null: false
  end
end
