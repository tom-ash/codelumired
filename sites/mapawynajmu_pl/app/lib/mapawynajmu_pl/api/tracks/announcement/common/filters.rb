# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Common
          module Filters
            private

            def filter_control
              {
                categoryFilterPanel: false,
                areaFilterPanel: false,
              }
            end

            def filter_data
              {
                categorySvgName: 'list',
                areaSvgName: 'area',
              }
            end

            def listing_filter_texts
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
              }[lang].merge(category_texts)
            end

            def category_texts
              text_categories_object = {}

              categories.each do |_category_key, category|
                text_categories_object["#{category[:trackified]}CategoryLabel"] = category[:name_plural][lang]
              end

              text_categories_object
            end

            def filter_inputs
              {
                category: category,
                areaOptions: areaOptions,
                area: area,
                areaMin: area_min,
                areaMax: area_max,
              }
            end

            def category
              return if current_category.blank?

              categories[current_category][:name_plural][lang]
            end

            def categories
              ::MapawynajmuPl::AnnouncementModules::Categories::CATEGORIES
            end

            def areaOptions
              %w[20 30 40 50 60 70 80 90 100 150 200]
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
          end
        end
      end
    end
  end
end
