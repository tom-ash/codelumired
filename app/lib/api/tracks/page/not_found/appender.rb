# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module NotFound
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::NotFound::Meta

          # lang -> from request
        end
      end
    end
  end
end
