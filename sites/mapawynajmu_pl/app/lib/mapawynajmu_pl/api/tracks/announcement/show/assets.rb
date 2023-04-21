# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          module Assets
            def asset_names
              @asset_names ||= %i[
                area
                list
                wallet
                vector-square
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
              ]
            end
          end
        end
      end
    end
  end
end
