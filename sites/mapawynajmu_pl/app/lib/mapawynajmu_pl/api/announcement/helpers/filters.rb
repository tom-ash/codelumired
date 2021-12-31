# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Announcement
      module Helpers
        module Filters
          extend Grape::API::Helpers

          private

          def announcement_filters
            @announcement_filters ||= { area_min: area_min, area_max: area_max }
          end

          def area_min
            @area_min ||= params[:area_min] || params[:powierzchnia_min]
          end

          def area_max
            @area_max ||= params[:area_max] || params[:powierzchnia_max]
          end
        end
      end
    end
  end
end
