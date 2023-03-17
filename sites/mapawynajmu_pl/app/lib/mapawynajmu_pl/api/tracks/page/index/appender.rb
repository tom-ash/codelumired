# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Index
          class Appender < ::Api::Tracks::Page::Index::Appender
            include ::MapawynajmuPl::Api::Tracks::Page::Index::Meta
          end
        end
      end
    end
  end
end
