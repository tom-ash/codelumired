# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Show
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::Listing::Show::Meta

            def initialize(announcement: nil, lang:, url: nil)
              @announcement = announcement
              @lang = lang
              @url = url
            end

            def call
              # TODO: Add hrefLang, title and label.

              {
                href: announcement.url(lang),
                title: 'TODO',
              }
            end

            def lang_links
              # TODO: Add hrefLang, title and label.

              hrefPl = "#{partner_path_with_slash(:pl)}#{category_path_with_slash(:pl)}#{announcement.url(:pl)}"
              hrefEn = "#{partner_path_with_slash(:en)}#{category_path_with_slash(:en)}#{announcement.url(:en)}"

              {
                'current/pl': {
                  href: "/#{hrefPl}",
                },
                'current/en': {
                  href: "/#{hrefEn}",
                },
              }
            end

            def go_back_link
              {
                'listing/index/go-back': {
                  href: "/#{partner_path_with_slash(lang)}#{category_path_with_slash(lang)}".chomp('/').presence || root_path,
                },
              }
            end

            private

            attr_reader :announcement, :lang, :url

            def root_path
              {
                pl: ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_PL,
                en: ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_EN,
              }[lang]
            end
          end
        end
      end
    end
  end
end
