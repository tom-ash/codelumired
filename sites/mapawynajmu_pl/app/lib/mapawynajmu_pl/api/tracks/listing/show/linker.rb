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
              {
                href: announcement.url(lang),
                # hrefLang,
                # title,
                # label,
              }
            end

            def linkMap
              hrefPl = "#{get_localized_href_prefix(:pl)}#{announcement.url(:pl)}"
              hrefEn = "#{get_localized_href_prefix(:en)}#{announcement.url(:en)}"

              {
                'current/pl': {
                  href: hrefPl,
                  # hrefLang,
                  # title,
                  # label,
                },
                'current/en': {
                  href: hrefEn,
                  # hrefLang,
                  # title,
                  # label,
                },
              }
            end

            def go_back_link
              {
                'listing/index/go-back': {
                  href: get_localized_href_prefix(lang),
                },
              }
            end

            private

            attr_reader :announcement, :lang, :url

            def get_localized_href_prefix(lang)
              localized_path = get_localized_path_prefix(category_from_path, lang)
              href_elements = ['/']
              href_elements.push("#{localized_path}/") if localized_path.present?
              href_elements.join()
            end
          end
        end
      end
    end
  end
end
