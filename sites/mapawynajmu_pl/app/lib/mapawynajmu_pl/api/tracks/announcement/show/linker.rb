# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          class Linker
            include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
            include ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta

            def initialize(announcement: nil, lang:, url: nil)
              @announcement = announcement
              @lang = lang
              @url = url
            end

            def call
              {
                path: announcement.url(lang),
                title: 'TODO',
              }
            end

            def lang_links
              {
                'current/pl': {
                  path: "#{partner_path_with_slash(:pl)}#{category_path_with_slash(:pl)}#{announcement.url(:pl)}",
                },
                'current/en': {
                  path: "#{partner_path_with_slash(:en)}#{category_path_with_slash(:en)}#{announcement.url(:en)}",
                },
              }
            end

            def go_back_link
              {
                'listing/index/go-back': {
                  path: "#{partner_path_with_slash(lang)}#{category_path_with_slash(lang)}".chomp('/').presence || root_path,
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
