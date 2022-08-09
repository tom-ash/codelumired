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
              area_max: area_max,
              price_min: price_min,
              price_max: price_max
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

          def price_min
            @price_min ||= params[:cena_min] ||
                           params[:price_min]
          end

          def price_max
            @price_max ||= params[:cena_maks] ||
                           params[:price_max]
          end

          def inputs
            {
              area_min: area_min.to_s,
              area_max: area_max.to_s,
              area_min_input: area_min.to_s,
              area_max_input: area_max.to_s,
              price_min: price_min.to_s,
              price_min_input: price_min.to_s,
              price_max: price_max.to_s,
              price_max_input: price_max.to_s
            }
          end
        end
      end
    end
  end
end
