# frozen_string_literal: true

module MapawynajmuPl
  module Commands
    module Listing
      class Create
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
        ].freeze
        STATIC_ATTRS = { status: 1, points: 0, views: 0, reports: [], visible: true, change_log: [] }.freeze

        def initialize(user_id:, attrs:)
          @user_id = user_id
          @attrs = attrs
        end

        def call
          create_announcement
          move_pictures
        end

        private

        attr_reader :user_id, :attrs

        def create_announcement
          announcement.save!
        end

        def announcement
          @announcement ||= user.announcements.new(parsed_attrs)
        end

        def move_pictures
          attrs[:pictures].each do |picture|
            ::PersistedObject.new("temporary/#{picture[:database]}").move_to(
              "announcements/#{announcement.id}/#{picture[:database]}",
            )
          end
        end

        def user
          @user ||= ::MapawynajmuPl::User.find(user_id)
        end

        def parsed_attrs
          direct_attrs.merge(
            **STATIC_ATTRS,
            **net_rent_amount_object,
            **net_rent_amount_per_sqm_object,
            **gross_rent_amount_object,
            **gross_rent_amount_per_sqm_object,
            **active_until_object,
            **user_verified_object,
            is_promoted: attrs[:add_promotion],
          )
        end

        def direct_attrs
          attrs.slice(*DIRECT_ATTR_NAMES)
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

        def active_until_object
          { active_until: Date.today + 60.days }
        end

        def user_verified_object
          { user_verified: attrs[:user_verified] }
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
