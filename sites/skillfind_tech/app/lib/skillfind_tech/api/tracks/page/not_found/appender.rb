# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module NotFound
          class Appender < ::Api::Tracks::Page::NotFound::Appender
            include ::SkillfindTech::Api::Tracks::Page::NotFound::Meta
            include ::SkillfindTech::ProtocolAndDomain

            private

            def asset_names
              @asset_names ||= %i[
                userPlus
                signIn
                signOut
                earthGlobe
              ]
            end
          end
        end
      end
    end
  end
end
