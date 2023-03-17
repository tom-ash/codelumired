# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Show
          class Appender < ::Api::Tracks::Page::Show::Appender
            include ::MapawynajmuPl::Api::Tracks::Page::Show::Meta
          end
        end
      end
    end
  end
end
