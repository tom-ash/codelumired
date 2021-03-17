# frozen_string_literal: true

module Warsawlease
  module Commands
    module Announcement
      class Create
        DIRECT_ATTR_NAMES = %i[category district area pictures longitude latitude rent_currency rooms floor total_floors features furnishings polish_description english_description].freeze
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
              "announcements/#{announcement.id}/#{picture[:database]}"
            )
          end
        end

        def user
          @user ||= ::Warsawlease::User.find(user_id)
        end

        def parsed_attrs
          direct_attrs.merge(
            **STATIC_ATTRS,
            **active_until,
            **net_rent_amount_per_sqm,
            **gross_rent_amount_per_sqm,
            **confirmed,
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

        def confirmed
          { confirmed: attrs[:confirmed] }
        end

        def availability_date
          ::Warsawlease::Helpers::Announcement::AvailabilityDateParser.new(attrs[:availability_date]).call
        end
      end
    end
  end
end
