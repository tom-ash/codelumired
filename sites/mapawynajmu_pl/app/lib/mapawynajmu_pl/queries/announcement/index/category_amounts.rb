# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    module Announcement
      module Index
        class CategoryAmounts
          CATEGORY_VALUES = {
            'apartments': 2, 'houses': 3, 'rooms': 4, 'parking_spaces': 5,
            'usable_premises': 1, 'offices': 0, 'virtual_offices': 6, 'coworking': 7
          }.freeze

          def initialize(params)
            @params = params
          end

          def call
            {
              apartments_amount: announcements.where(category: CATEGORY_VALUES[:apartments]).count,
              houses_amount: announcements.where(category: CATEGORY_VALUES[:houses]).count,
              rooms_amount: announcements.where(category: CATEGORY_VALUES[:rooms]).count,
              parking_spaces_amount: announcements.where(category: CATEGORY_VALUES[:parking_spaces]).count,
              usable_premises_amount: announcements.where(category: CATEGORY_VALUES[:usable_premises]).count,
              offices_amount: announcements.where(category: CATEGORY_VALUES[:offices]).count,
              virtual_offices_amount: announcements.where(category: CATEGORY_VALUES[:virtual_offices]).count,
              coworking_amount: announcements.where(category: CATEGORY_VALUES[:coworking]).count
            }
          end

          private

          def announcements
            @announcements ||= ::MapawynajmuPl::Announcement.where(visible: true, confirmed: true)
          end
        end
      end
    end
  end
end
