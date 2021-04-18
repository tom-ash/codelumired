# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      module Index
        class User
          ATTRS = %w[
            id category district area pictures longitude latitude
            rent_currency net_rent_amount net_rent_amount_per_sqm gross_rent_amount gross_rent_amount_per_sqm    
            rooms floor total_floors
            status visible views active_until created_at updated_at
          ].freeze

          def initialize(announcements)
            @announcements = announcements
          end

          def call
            announcements.map { |announcement| serialize_announcement(announcement) }
          end

          private

          attr_reader :announcements

          def serialize_announcement(announcement)
            announcement.attributes.slice(*ATTRS).merge(availability_date(announcement))
          end

          def availability_date(announcement)
            { availability_date: ::Warsawlease::Serializers::Announcement::AvailabilityDate.new(announcement.availability_date).call }
          end
        end
      end
    end
  end
end
