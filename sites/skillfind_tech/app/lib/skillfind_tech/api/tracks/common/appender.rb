# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Common
        class Appender < ::Api::Tracks::Common::Appender
          include ::SkillfindTech::ProtocolAndDomain

          private

          def header_asset_names
            @header_asset_names ||= %i[
              userPlus
              signIn
              signOut
              earthGlobe
              plus
              circleUser
              cog
              listOl
              copyright
            ]
          end
        end
      end
    end
  end
end
