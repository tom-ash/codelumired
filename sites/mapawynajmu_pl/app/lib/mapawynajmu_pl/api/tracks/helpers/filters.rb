# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Helpers
        module Filters
          private

          def filters
            @filters ||= {
              area_min: area_min,
              area_max: area_max
            }
          end

          def area_min
            @area_min ||= params[:area_min] ||
                          params[:powierzchnia_min]
          end

          def area_max
            @area_max ||= params[:area_max] ||
                          params[:powierzchnia_max]
          end

          def inputs
            {
              area_min: area_min.to_s,
              area_max: area_max.to_s,
              area_min_input: area_min.to_s,
              area_max_input: area_max.to_s
            }
          end
        end
      end
    end
  end
end
