# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Edit
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Image::Edit::Meta

          private

          def merge_state
            # TODO
          end
        end
      end
    end
  end
end
