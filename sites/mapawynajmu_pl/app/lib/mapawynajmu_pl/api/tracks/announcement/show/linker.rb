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

            def go_back_link
              root_pl = ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_PL
              root_en = ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_EN

              return { path: current_partner_path(lang) } if current_partner.present?

              {
                path: {
                  pl: root_pl,
                  en: root_en,
                }[lang],
              }
            end

            private

            attr_reader :announcement, :lang, :url
          end
        end
      end
    end
  end
end
