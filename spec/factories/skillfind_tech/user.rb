# frozen_string_literal: true

FactoryBot.define do
  factory :skillfind_tech_user, class: ::SkillfindTech::User do
    email { 'test2@example.net' }
    email_verified_at { nil }
    hashed_password { '$2a$12$pm9aETt3XZNW6R1MMlXgz.jE1OeGmTquN2In0YBWaFSmTMMtj/M1e' }
    password_salt { '3a72e9ee7cb8a118996301e9ae55d93a11441264cf3aa0190fde39c46083dde3' }
    change_log { [] }
    industry { 'software_house' }
  end
end
