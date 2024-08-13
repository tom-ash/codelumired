# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module About
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Visitor::About::Meta

            private

            def texts
              getLocalizations("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/about/localizations/#{lang}.json")
            end

            def asset_names
              @asset_names ||= header_asset_names
            end
          end
        end
      end
    end
  end
end
