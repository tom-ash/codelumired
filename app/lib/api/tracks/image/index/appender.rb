# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Index
        class Appender < ::Api::Tracks::Common::Appender
          private

          def data
            {
              image_keys: image_keys,
            }
          end

          def inputs
            # TODO: Add imageKey.
          end

          def image_keys
            site::Image.order(storage_key: :asc).pluck(:storage_key)
          end
        end
      end
    end
  end
end
