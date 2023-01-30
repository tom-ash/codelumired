# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Linker
          include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
          include ::MapawynajmuPl::Api::Tracks::Root::Meta

          ROOT_PL = '/'
          ROOT_EN = 'en'

          def initialize(lang, url = nil)
            @lang = lang
            @url = url
          end

          attr_reader :url

          def call
            {
              pl: { path: ROOT_PL },
              en: { path: ROOT_EN },
            }[lang]
          end

          def lang_links
            {
              'current/pl': {
                path: "#{partner_path_with_slash(:pl)}#{category_path_with_slash(:pl)}",
              },
              'current/en': {
                path: "#{partner_path_with_slash(:en)}#{category_path_with_slash(:en)}".presence || ROOT_EN,
              },
            }
          end
        end
      end
    end
  end
end
