# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
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
              href: href,
              href_lang: lang,
              path: path,
              label: label,
              title: title,
            }
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

          private

          def href
            "#{protocol_and_domain}/#{path}"
          end

          def path
            {
              pl: ROOT_PL,
              en: ROOT_EN,
            }[lang].chomp('/')
          end

          def label
            {
              pl: 'Strona główna',
              en: 'Main Page',
            }[lang]
          end
        end
      end
    end
  end
end
