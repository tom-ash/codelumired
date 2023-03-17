# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Edit
          class Appender < ::Api::Tracks::Page::Edit::Appender
            include ::MapawynajmuPl::Api::Tracks::Page::Edit::Meta
          end
        end
      end
    end
  end
end
