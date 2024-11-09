# frozen_string_literal: true

module MapawynajmuPl
  module Commands
    module Listing
      class Update
        DIRECT_ATTR_NAMES = %i[
          category
          area
          pictures
          longitude
          latitude
          rent_currency
          rooms
          floor
          total_floors
          availability_date
          features
          furnishings
          polish_description
          english_description
          locality
          sublocality
          name
          link
          social_image
        ].freeze

        def initialize(id:, attrs:)
          @id = id
          @attrs = attrs
        end

        def call
          persist_pictures
          persist_social_image
          listing.update!(parsed_attrs)
        end

        private

        attr_reader :id, :attrs

        def persist_pictures
          pictures_to_persist.each do |picture|
            ::PersistedObject.new("temporary/#{picture}").move_to(
              "announcements/#{listing.id}/#{picture}",
            )
          end
        end

        def persist_social_image
          social_image = direct_attrs[:social_image]

          ::PersistedObject.new("temporary/#{social_image}").move_to(
            "listings/#{listing.id}/social_image/#{social_image}",
          )
        end

        def listing
          @listing ||= MapawynajmuPl::Listing.find(id)
        end

        def pictures_to_persist
          @pictures_to_persist ||= new_picture_keys - current_picture_keys
        end

        # def pictures_to_delete
        #   @pictures_to_delete ||= current_picture_keys - new_picture_keys
        # end

        def new_picture_keys
          @new_picture_keys ||= attrs[:pictures].map do |picture|
            picture['database']
          end
        end

        def current_picture_keys
          @current_picture_keys ||= listing.pictures.map do |picture|
            picture['database']
          end
        end

        def parsed_attrs
          direct_attrs.merge(
            **net_rent_amount_object,
            **net_rent_amount_per_sqm_object,
            **gross_rent_amount_object,
            **gross_rent_amount_per_sqm_object,
            **active_until,
          )
        end

        def direct_attrs
          @direct_attrs ||= attrs.slice(*DIRECT_ATTR_NAMES)
        end

        def net_rent_amount_object
          { net_rent_amount: net_rent_amount }
        end

        def net_rent_amount_per_sqm_object
          return {} if net_rent_amount.blank? || area.blank?

          { net_rent_amount_per_sqm: (net_rent_amount / area).ceil(2) }
        end

        def gross_rent_amount_object
          { gross_rent_amount: gross_rent_amount }
        end

        def gross_rent_amount_per_sqm_object
          return {} if gross_rent_amount.blank? || area.blank?

          { gross_rent_amount_per_sqm: (gross_rent_amount / area).ceil(2) }
        end

        def active_until
          { active_until: Date.today + 60.days }
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
      end
    end
  end
end
