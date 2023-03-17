# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Verification
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
              include ::MapawynajmuPl::Api::Tracks::User::Create::Verification::State
              include ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta
            end
          end
        end
      end
    end
  end
end
