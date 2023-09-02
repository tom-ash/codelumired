# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Promote
          module Assets
            def asset_names
              @asset_names ||= %i[
                chevron
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
