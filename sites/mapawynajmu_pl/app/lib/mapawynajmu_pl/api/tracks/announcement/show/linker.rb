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
              # byebug
              {
                path: {
                  pl: ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_PL,
                  en: ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_EN,
                }[lang],
              }
            end

            private

            attr_reader :announcement, :lang
          end
        end
      end
    end
  end
end
