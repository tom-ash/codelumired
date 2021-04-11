# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      class Edit
        include Camelize

        ATTRS = %w[
          id user_id category district area pictures longitude latitude
          rent_currency net_rent_amount net_rent_amount_per_sqm gross_rent_amount gross_rent_amount_per_sqm
          rooms floor total_floors features furnishings polish_description english_description
          status visible views active_until created_at updated_at
        ].freeze

        def initialize(announcement)
          @announcement = announcement
        end

        def call
          camelize(announcement_attrs.merge(availability_date))
        end

        private

        attr_reader :announcement

        def announcement_attrs
          @announcement.attributes.slice(*ATTRS)
        end

        def availability_date
          { availability_date: ::Warsawlease::Serializers::Announcement::AvailabilityDate.new(announcement.availability_date).call }
        end
      end
    end
  end
end
