# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Assets
        module Index
          class Appender < ::Api::Tracks::Assets::Index::Appender
            include ::MapawynajmuPl::Api::Tracks::Assets::Index::Meta
          end
        end
      end
    end
  end
end
