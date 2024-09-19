# frozen_string_literal: true

FactoryBot.define do
  factory :skillfind_tech_posting, class: ::SkillfindTech::Posting do
    user { create(:skillfind_tech_user) }
    views { 0 }
    company_size { 1 }
    country { 'Poland' }
    locality { 'Warsaw' }
    employment { true }
    b2b { true }
    employment_min { 0 }
    employment_max { 0 }
    b2b_min { 0 }
    b2b_max { 0 }
    cooperation_mode { 'remote' }
    place_autocomplete { 'test' }
    place_id { 'test' }
    link_application_manner { true }
    form_application_manner { false }
    verified { true }
    position { 'test' }
    lat { 52 }
    lng { 12 }
  end
end
