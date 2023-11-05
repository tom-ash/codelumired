# frozen_string_literal: true

module MapawynajmuPl
  module Serializers
    module Listing
      class Tile
        ATTRS = %w[
          id
          category
          area
          pictures
          rent_currency
          net_rent_amount
          net_rent_amount_per_sqm
          gross_rent_amount
          gross_rent_amount_per_sqm
          rooms
          floor
          total_floors
          availability_date
          locality
          sublocality
          name
          link
        ].freeze

        def initialize(announcement:, lang:)
          @announcement = announcement
          @lang = lang.to_sym
        end

        def call
          announcement_attrs
        end

        private

        attr_reader :announcement, :lang

        def announcement_attrs
          @announcement.attributes.slice(*ATTRS).merge(
            phone: announcement.user.showcase['phone'],
            href: "/#{announcement.url(lang)}",
            title: announcement.title(lang),
            description: { pl: announcement[:polish_description], en: announcement[:english_description] }[lang]
          )
        end
      end
    end
  end
end
