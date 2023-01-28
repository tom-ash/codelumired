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
              if current_partner.present? || current_category.present?
                partner_path = current_partner.present? ? "#{current_partner_path(lang)}/" : ''
                category_path = current_category.present? ? current_category_path(lang) : ''

                return {
                  path: "#{partner_path}#{category_path}".chomp('/'),
                }
              end

              {
                path: {
                  pl: ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_PL,
                  en: ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_EN,
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
