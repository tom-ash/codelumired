# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Edit
          module Assets
            def asset_names
              @asset_names ||= %i[
                info
                caretDown
                camera
                close
                chevron
                rotate
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
                facebook_square
                linkedin_square
                twitter_square
              ]
            end
          end
        end
      end
    end
  end
end
