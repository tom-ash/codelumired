# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Redirects
        module Index
          class Appender < ::Api::Tracks::Redirects::Index::Appender
            include ::MapawynajmuPl::Api::Tracks::Redirects::Index::Meta
          end
        end
      end
    end
  end
end
