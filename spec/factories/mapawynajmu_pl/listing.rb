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
  end
end
