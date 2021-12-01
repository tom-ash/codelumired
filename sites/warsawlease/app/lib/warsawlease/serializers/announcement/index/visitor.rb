# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      module Index
        class Visitor
          ATTRS = %w[
            id category district area pictures longitude latitude
            rent_currency net_rent_amount net_rent_amount_per_sqm gross_rent_amount gross_rent_amount_per_sqm    
            rooms floor total_floors availability_date
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
            serialized_announcement['path'] = announcement.url(lang)
            serialized_announcement['title'] = announcement.title(lang)
            serialized_announcement
          end
        end
      end
    end
  end
end
