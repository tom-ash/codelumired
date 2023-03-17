# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Image
        module Edit
          class Appender < ::Api::Tracks::Image::Edit::Appender
            include ::MapawynajmuPl::Api::Tracks::Image::Edit::Meta
          end
        end
      end
    end
  end
end
