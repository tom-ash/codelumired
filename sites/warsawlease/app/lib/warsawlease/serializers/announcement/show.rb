# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      class Show
        ATTRS = %w[
          id category district area pictures longitude latitude
          rent_currency net_rent_amount net_rent_amount_per_sqm gross_rent_amount gross_rent_amount_per_sqm
          rooms floor total_floors features furnishings polish_description english_description
        ].freeze

        def initialize(announcement)
          @announcement = announcement
        end

        def call
          announcement_attrs.merge(availability_date).merge(showcase)
        end

        private

        attr_reader :announcement

        def announcement_attrs
          @announcement.attributes.slice(*ATTRS)
        end

        def availability_date
          { availability_date: ::Warsawlease::Serializers::Announcement::AvailabilityDate.new(announcement.availability_date).call }
        end

        def showcase
          user = announcement.user

          { name: user.showcase['name'], phone: user.showcase['phone'] }
        end
      end
    end
  end
end
