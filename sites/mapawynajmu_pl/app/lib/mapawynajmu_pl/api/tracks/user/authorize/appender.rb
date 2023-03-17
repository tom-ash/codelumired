# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Authorize
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta
            include ::MapawynajmuPl::Api::Tracks::User::Authorize::State
          end
        end
      end
    end
  end
end
