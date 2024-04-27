# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Auth
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::User::Auth::Meta
            include ::SkillfindTech::Api::Tracks::User::Auth::State

            private

            def asset_names
              @asset_names ||= header_asset_names
            end
          end
        end
      end
    end
  end
end
