# frozen_string_literal: true

module Warsawlease
  module Commands
    module Announcement
      class Update
        DIRECT_ATTR_NAMES = %i[category district area pictures longitude latitude rent_currency rooms floor total_floors features furnishings polish_description english_description].freeze

        def initialize(id:, attrs:)
          @id = id
          @attrs = attrs
        end

        def call
          announcement.update!(parsed_attrs)
        end

        private

        attr_reader :id, :attrs

        def announcement
          @announcement ||= Warsawlease::Announcement.find(id)
        end

        def parsed_attrs
          direct_attrs.merge(
            **active_until,
            **net_rent_amount_per_sqm,
            **gross_rent_amount_per_sqm,
            **availability_date
          )
        end

        def direct_attrs
          attrs.slice(*DIRECT_ATTR_NAMES)
        end

        def active_until
          { active_until: Date.today + 60.days }
        end

        def net_rent_amount_per_sqm
          return {} if net_rent_amount.blank?

          { net_rent_amount: net_rent_amount, net_rent_amount_per_sqm: (net_rent_amount / area).ceil(2) }
        end

        def gross_rent_amount_per_sqm
          return {} if gross_rent_amount.blank?

          { gross_rent_amount: gross_rent_amount, gross_rent_amount_per_sqm: (gross_rent_amount / area).ceil(2) }
        end

        def net_rent_amount
          @net_rent_amount ||= attrs[:net_rent_amount]
        end

        def gross_rent_amount
          @gross_rent_amount ||= attrs[:gross_rent_amount]
        end

        def area
          @area ||= attrs[:area]
        end

        def availability_date
          ::Warsawlease::Helpers::Announcement::AvailabilityDateParser.new(attrs[:availability_date]).call
        end
      end
    end
  end
end
