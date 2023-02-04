# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            module Assets
              def asset_names
                @asset_names ||= %i[
                  arrowRight
                  globe
                  calendar
                  apartment
                  house
                  room
                  parkingSpace
                  usablePremises
                  office
                  virtualOffice
                  coworkingSpace
                  advertisingSpaces
                  garage
                  facebook
                  chevron
                  close
                  phone
                  caretDown
                  check
                ]
              end
            end
          end
        end
      end
    end
  end
end
