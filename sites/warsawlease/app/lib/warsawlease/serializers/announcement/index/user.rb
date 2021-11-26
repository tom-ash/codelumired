# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      module Index
        class User
          ATTRS = %w[
            id category district area pictures longitude latitude
            rent_currency net_rent_amount net_rent_amount_per_sqm gross_rent_amount gross_rent_amount_per_sqm
            rooms floor total_floors availability_date
            status visible views active_until created_at updated_at
          ].freeze

          def initialize(announcements, lang)
            @announcements = announcements
            @lang = lang
          end

          def call
            announcements.map { |announcement| serialize_announcement(announcement) }
          end

          private

          attr_reader :announcements, :lang

          def serialize_announcement(announcement)
            serialized_announcement = announcement.attributes.slice(*ATTRS)
            serialized_announcement['url'] = announcement.url(lang)
            serialized_announcement['title'] = announcement.title(lang)
            serialized_announcement['edit_path'] = announcement.edit_url(lang)
            serialized_announcement['edit_title'] = announcement.edit_title(lang)
            serialized_announcement
          end

          def root_domain
            return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

            'https://www.warsawlease.pl'
          end
        end
      end
    end
  end
end
