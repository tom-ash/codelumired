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
                  chevron
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
