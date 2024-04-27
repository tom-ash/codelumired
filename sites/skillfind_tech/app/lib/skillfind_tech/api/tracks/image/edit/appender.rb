# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Image
        module Edit
          class Appender < ::Api::Tracks::Image::Edit::Appender
            include ::SkillfindTech::Api::Tracks::Image::Edit::Meta
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
