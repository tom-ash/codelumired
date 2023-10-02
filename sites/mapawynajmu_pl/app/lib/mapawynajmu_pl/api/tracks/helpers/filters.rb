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
              price_max: price_max,
              lat: lat,
              lng: lng,
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

          def lat
            @lat ||= params[:lat]
          end

          def lng
            @lng ||= params[:lng]
          end
        end
      end
    end
  end
end
