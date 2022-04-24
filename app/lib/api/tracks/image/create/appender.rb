# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Create
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Image::Create::Meta

          private

          def merge_state
            state.merge!(
              'image/create': {
                image_keys: image_keys
              }
            )
          end

          def image_keys
            site::Image.pluck(:storage_key)
          end
        end
      end
    end
  end
end
