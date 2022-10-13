# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::MapawynajmuPl::Api::Tracks::Root::Meta
          include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
          include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

          private

          def merge_state
            state.merge!(
              'announcement/index/data': data,
              'announcement/index/inputs': inputs,
              'announcement/index/control': {
                current_tile_id: nil,
              },
            )
          end

          def data
            data_hash = {
              current_category: category,
              title: title,
              tile: nil,
            }

            if ssr?
              data_hash.merge!(
                announcements: serialized_announcements,
                amount: serialized_announcements.count,
              )
            end

            data_hash
          end
        end
      end
    end
  end
end
