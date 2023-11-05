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
              label: label,
              title: title,
            }
          end

          def lang_links
            # TODO: Add partners and categories.

            hrefPl = "/"
            hrefEn = "/en"

            {
              'current/pl': {
                href: hrefPl,
              },
              'current/en': {
                href: hrefEn,
              },
            }
          end

          private

          def href
            {
              pl: ROOT_PL,
              en: ROOT_EN,
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
