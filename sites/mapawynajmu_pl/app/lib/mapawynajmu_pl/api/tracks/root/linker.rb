# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
          include ::MapawynajmuPl::Api::Tracks::Root::Meta

          ROOT_PL = '/'
          ROOT_EN = 'en'

          def initialize(lang = nil, url = nil)
            @lang = lang
            @url = url
          end

          attr_reader :url

          def call
            {
              href: href,
              hrefLang: lang,
              label: label,
              title: title,
            }
          end

          def lang_links
            pathPl = get_localized_path_prefix(category_from_path, :pl)
            hrefPl = "/#{pathPl}"

            pathEn = get_localized_path_prefix(category_from_path, :en)
            hrefEn = "/#{pathEn == '' ? ROOT_EN : pathEn}"

            {
              'current/pl': {
                href: hrefPl,
                # hrefLang,
                # title,
                # label,
              },
              'current/en': {
                href: hrefEn == '/' ? ROOT_EN : hrefEn,
                # hrefLang,
                # title,
                # label,
              },
            }
          end

          private

          def href
            {
              pl: ROOT_PL,
              en: "/#{ROOT_EN}",
            }[lang]
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
