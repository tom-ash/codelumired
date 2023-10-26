# frozen_string_literal: true

FactoryBot.define do
  factory :mapawynajmu_pl_page, class: ::MapawynajmuPl::Page do
    user { create(:mapawynajmu_pl_user) }

    lang { 'pl' }
    url { 'test-page-url' }
    # title
    # keywords
    # description
    body { [] }
    # canonical_url
    # cover_image
    # online
    # header_autonumbering
    schema_mode { 'auto' }
    auto_schema { {} }
    manual_schema { {} }
    # published_on
    # modified_on
    # category
    # subcategory
    # lang_alts_group
    # link_image
    # index_now_pinged_at
  end
end
