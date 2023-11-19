# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Common
        class Sitemap < ::Api::Tracks::Common::Sitemap
          private

          def self.appLangs
            @appLangs ||= SKILLFIND_TECH_NAME_LANGS
          end
        end
      end
    end
  end
end
