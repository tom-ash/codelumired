# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        module Assets
          def asset_names
            @asset_names ||= %i[
              # filters
              list
              area
              coins

              # pins
              apartment
              room
              house
              parkingSpace
              garage
              usablePremises
              office
              virtualOffice
              coworkingSpace
              advertisingSpaces

              # check
              facebook
              chevron
              calendar
              close
              phone
              caretDown
              arrowRight
              globe
            ]
          end
        end
      end
    end
  end
end
