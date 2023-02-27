# frozen_string_literal: true

FactoryBot.define do
  factory :mapawynajmu_pl_user, class: MapawynajmuPl::User do
    email { 'test@example.net' }
    email_confirmed_at { nil }
    status { 0 }
    points { 0 }
    role { nil }
    hashed_password { '$2a$12$pm9aETt3XZNW6R1MMlXgz.jE1OeGmTquN2In0YBWaFSmTMMtj/M1e' }
    password_salt { '3a72e9ee7cb8a118996301e9ae55d93a11441264cf3aa0190fde39c46083dde3' }
    consents {
      [{
        granted: true,
        expressed_at: '2021-03-14T17:02:24.779Z',
        displayed_text: 'Akceptuję Regulamin i Politykę Prywatności.',
      }]
    }
    account_type { nil }
    first_name { nil }
    last_name { nil }
    business_name { nil }
    legal_name { nil }
    tax_number { nil }
    address { nil }
    country_code { '+48' }
    phone_number { '100200300' }
    phone { {} }
    showcase { { name: 'Gandalf', phone: '+48 100' } }
    change_log { [] }
  end
end
