# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Common
        class Sitemap < ::Api::Tracks::Common::Sitemap
          private

          def self.appLangs
            @appLangs ||= MAPAWYNAJMU_PL_NAME_LANGS
          end
        end
      end
    end
  end
end
