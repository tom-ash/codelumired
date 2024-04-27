# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Image
        module Index
          class Appender < ::Api::Tracks::Image::Index::Appender
            include ::SkillfindTech::Api::Tracks::Image::Index::Meta
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
