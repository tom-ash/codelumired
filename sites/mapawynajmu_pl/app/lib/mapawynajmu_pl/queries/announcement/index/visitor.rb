# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    module Announcement
      module Index
        class Visitor
          def initialize(
            partner: nil,
            category: nil,
            area_min: nil,
            area_max: nil,
            price_min: nil,
            price_max: nil
          )
            @partner = partner
            @category = category
            @area_min = area_min
            @area_max = area_max
            @price_min = price_min
            @price_max = price_max
          end

          def call
            announcements
          end

          private

          attr_reader :partner, :category, :area_min, :area_max, :price_min, :price_max

          def announcements
            @announcement ||= ::MapawynajmuPl::Announcement.where(search_params)
                                                           .order('points DESC')
                                                           .order('active_until DESC')

            @announcement = @announcement.where(user_id: partner.id) if partner.present?

            @announcement = @announcement.where('area >= ?', area_min) if area_min.present?
            @announcement = @announcement.where('area <= ?', area_max) if area_max.present?

            @announcement = @announcement.where('gross_rent_amount >= ?', price_min) if price_min.present?
            @announcement = @announcement.where('gross_rent_amount <= ?', price_max) if price_max.present?

            @announcement
          end

          def search_params
            shared_search_params.merge(category_search_params)
          end

          def shared_search_params
            { visible: true, confirmed: true }
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
