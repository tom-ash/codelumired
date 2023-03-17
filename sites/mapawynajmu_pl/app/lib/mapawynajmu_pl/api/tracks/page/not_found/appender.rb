# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module NotFound
          class Appender < ::Api::Tracks::Page::NotFound::Appender
            include ::MapawynajmuPl::Api::Tracks::Page::NotFound::Meta
          end
        end
      end
    end
  end
end
