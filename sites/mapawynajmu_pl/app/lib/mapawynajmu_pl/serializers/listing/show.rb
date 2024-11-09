# frozen_string_literal: true

module MapawynajmuPl
  module Serializers
    module Listing
      class Show
        ATTRS = %w[
          id
          category
          area
          pictures
          longitude
          latitude
          rent_currency
          net_rent_amount
          net_rent_amount_per_sqm
          gross_rent_amount
          gross_rent_amount_per_sqm
          rooms
          floor
          total_floors
          availability_date
          features
          furnishings
          polish_description
          english_description
          locality sublocality
          name
          link
          is_promoted
          # social_image
        ].freeze

        def initialize(announcement)
          @announcement = announcement
        end

        def call
          announcement_attrs
        end

        private

        attr_reader :announcement

        def announcement_attrs
          @announcement.attributes.slice(*ATTRS).merge(
            phone: announcement.user.showcase['phone'],
          )
        end
      end
    end
  end
end
