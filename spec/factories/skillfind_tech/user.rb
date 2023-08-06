# frozen_string_literal: true

# create_table "users", force: :cascade do |t|
#   t.string "email", null: false
#   t.string "role"
#   t.string "account_type"
#   t.string "first_name"
#   t.string "last_name"
#   t.string "hashed_password", null: false
#   t.string "password_salt", null: false
#   t.jsonb "change_log", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.datetime "email_verified_at", precision: nil
#   t.datetime "deleted_at"
# end

FactoryBot.define do
  factory :skillfind_tech_user, class: ::SkillfindTech::User do
    email { 'test2@example.net' }
    email_verified_at { nil }
    # status { 0 }
    # points { 0 }
    # role { nil }
    hashed_password { '$2a$12$pm9aETt3XZNW6R1MMlXgz.jE1OeGmTquN2In0YBWaFSmTMMtj/M1e' }
    password_salt { '3a72e9ee7cb8a118996301e9ae55d93a11441264cf3aa0190fde39c46083dde3' }
    # consents {
    #   [{
    #     granted: true,
    #     expressed_at: '2021-03-14T17:02:24.779Z',
    #     displayed_text: 'Akceptuję Regulamin i Politykę Prywatności.',
    #   }]
    # }
    # account_type { nil }
    # first_name { nil }
    # last_name { nil }
    # business_name { nil }
    # legal_name { nil }
    # tax_number { nil }
    # address { nil }
    # country_code { '+48' }
    # phone_number { '100200300' }
    # phone { {} }
    # showcase { { name: 'Gandalf', phone: '+48 100' } }
    change_log { [] }
  end
end
