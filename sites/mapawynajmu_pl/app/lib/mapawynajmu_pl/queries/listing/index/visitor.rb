# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    module Listing
      module Index
        class Visitor
          def initialize(
            partner: nil,
            category: nil,
            area_min: nil,
            area_max: nil,
            price_min: nil,
            price_max: nil,
            lat: nil,
            lng: nil
          )
            @partner = partner
            @category = category
            @area_min = area_min
            @area_max = area_max
            @price_min = price_min
            @price_max = price_max
            @lat = lat
            @lng = lng
          end

          def call
            announcements
          end

          private

          attr_reader :partner, :category, :area_min, :area_max, :price_min, :price_max, :lat, :lng

          def announcements
            @announcement ||= ::MapawynajmuPl::Listing.where(search_params)
                                                           .order('is_promoted DESC')
                                                           .order('points DESC')
                                                           .order('active_until DESC')

            @announcement = @announcement.where(user_id: partner.id) if partner.present?

            @announcement = @announcement.where('area >= ?', area_min) if area_min.present?
            @announcement = @announcement.where('area <= ?', area_max) if area_max.present?

            @announcement = @announcement.where('gross_rent_amount >= ?', price_min) if price_min.present?
            @announcement = @announcement.where('gross_rent_amount <= ?', price_max) if price_max.present?

            if lat.present?
              @announcement = @announcement.where('latitude BETWEEN ? AND ?', lat.to_f - 0.5, lat.to_f + 0.5)
            end

            if lng.present?
              @announcement = @announcement.where('longitude BETWEEN ? AND ?', lng.to_f - 0.5, lng.to_f + 0.5)
            end

            @announcement
          end

          def search_params
            shared_search_params.merge(category_search_params)
          end

          def shared_search_params
            {
              user_verified: true,
              visible: true,
              deleted_at: nil,
            }
          end

          def category_search_params
            return {} if category.blank?

            { category: category }
          end
        end
      end
    end
  end
end
