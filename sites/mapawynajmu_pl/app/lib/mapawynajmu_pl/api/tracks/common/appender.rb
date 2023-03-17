# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Common
        class Appender < ::Api::Tracks::Common::Appender
          include ::MapawynajmuPl::ProtocolAndDomain
        end
      end
    end
  end
end
