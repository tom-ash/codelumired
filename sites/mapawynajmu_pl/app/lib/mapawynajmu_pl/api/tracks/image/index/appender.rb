# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Image
        module Index
          class Appender < ::Api::Tracks::Image::Index::Appender
            include ::MapawynajmuPl::Api::Tracks::Image::Index::Meta
          end
        end
      end
    end
  end
end
