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

          def texts
            {
              pl: {
                categoryInputPlaceholder: 'Kategoria',
                areaInputPlaceholder: 'Powierzchnia',
                areaMinInputLabel: 'Min.',
                areaMaxInputLabel: 'Maks.',
              },
              en: {
                categoryInputPlaceholder: 'Category',
                areaInputPlaceholder: 'Area',
                areaMinInputLabel: 'Min.',
                areaMaxInputLabel: 'Max.',
              },
            }[lang].merge(text_categories)
          end

          def control
            {
              categoryFilterPanel: false,
              areaFilterPanel: false,
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
              areaSvgName: 'area',
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

          def inputs
            text_categories
            {
              category: category,
              areaMin: area_min,
              areaMax: area_max,
              area: area,
              areaOptions: areaOptions,
            }
          end

          def areaOptions
            %w[
              20
              30
              40
              50
              60
              70
              80
              90
              100
              150
              200
            ]
          end

          def text_categories
            text_categories_object = {}

            categories.each do |_category_key, category|
              text_categories_object["#{category[:trackified]}CategoryLabel"] = category[:name_plural][lang]
            end

            text_categories_object
          end

          def category
            return if current_category.blank?

            categories[current_category][:name_plural][lang]
          end

          def area
            if area_min.present? && area_max.present?
              "#{area_min} - #{area_max} #{area_unit}"
            elsif area_min.present?
              "> #{area_min} #{area_unit}"
            elsif area_max.present?
              "< #{area_max} #{area_unit}"
            else
              ''
            end
          end

          def area_unit
            lang == :pl ? 'm2' : 'sqm'
          end

          def categories
            ::MapawynajmuPl::AnnouncementModules::Categories::CATEGORIES
          end
        end
      end
    end
  end
end
