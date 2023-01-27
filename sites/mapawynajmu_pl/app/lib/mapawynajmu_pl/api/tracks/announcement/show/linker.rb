# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          class Linker
            def initialize(announcement: nil, lang:)
              @announcement = announcement
              @lang = lang
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

              # return partner_and_category_paths if partner.present? && category.present?
              # return partner_paths if partner.present?
              # return category_paths if category.present?

              # byebug
              {
                path: {
                  pl: root_pl,
                  en: root_en,
                }[lang],
              }
            end

            private

            attr_reader :announcement, :lang

            def go_back_partner_link
              
            end
          end
        end
      end
    end
  end
end
