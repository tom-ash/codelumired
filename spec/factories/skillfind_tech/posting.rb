# frozen_string_literal: true

FactoryBot.define do
  factory :skillfind_tech_posting, class: ::SkillfindTech::Posting do
    user { create(:skillfind_tech_user) }
    views { 0 }
    company_name { 'TEST' }
    company_size { 1 }
    remote { true }
    hybrid { true }
    office { true }
    country { 'Poland' }
    locality { 'Warsaw' }
    employment { true }
    b2b { true }
    employment_min { 0 }
    employment_max { 0 }
    b2b_min { 0 }
    b2b_max { 0 }
    description { 'foobar' }
  end
end
