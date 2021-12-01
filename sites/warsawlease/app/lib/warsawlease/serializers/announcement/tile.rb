# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      class Tile
        ATTRS = %w[
          id category district area pictures
          rent_currency net_rent_amount net_rent_amount_per_sqm gross_rent_amount gross_rent_amount_per_sqm
          rooms floor total_floors availability_date
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
            path: announcement.url(lang),
            title: announcement.title(lang)
          )
        end
      end
    end
  end
end
