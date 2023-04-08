# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
          include ::MapawynajmuPl::Api::Tracks::Root::Assets
          include ::MapawynajmuPl::Api::Tracks::Root::Meta
          include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
          include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

          private

          def inputs
            text_categories
            {
              category: category,
            }
          end

          def category
            return if current_category.blank?

            categories[current_category][:name_plural][lang]
          end

          def categories
            ::MapawynajmuPl::AnnouncementModules::Categories::CATEGORIES
          end

          def text_categories
            text_categories_object = {}

            categories.each do |_category_key, category|
              text_categories_object["#{category[:trackified]}CategoryLabel"] = category[:name_plural][lang]
            end

            text_categories_object
          end

          def control
            {
              categoryFilterPanel: false,
              isMapInitialized: false,
              shouldInitializeMap: false,
              isPinsDrawn: false,
              mapOptions: {
                center: {
                  lat: 52,
                  lng: 19,
                },
                zoom: 6.7,
              },
            }
          end

          def data
            data_hash = {
              categorySvgName: 'list',
              current_category: current_category,
              current_partner_name: current_partner&.business_name,
              title: title,
              tile: nil,
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
            }

            # if ssr? || attrs[:listings_obsolete]
            #   data_hash.merge!(
            #     announcements: serialized_announcements,
            #     amount: serialized_announcements.count,
            #   )
            # end

            data_hash
          end

          def texts
            {
              pl: {
                categoryInputPlaceholder: 'Kategoria',
              },
              en: {
                categoryInputPlaceholder: 'Category',
              },
            }[lang].merge(text_categories)
          end
        end
      end
    end
  end
end
