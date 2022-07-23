# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Linker
          include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
          include ::MapawynajmuPl::Api::Tracks::Root::Meta

          def initialize(lang, url = nil)
            @lang = lang
            @url = url
          end

          attr_reader :url

          def call
            {
              pl: { path: '/' },
              en: { path: 'en' }
            }[lang]
          end

          def lang_links
            if category.present?
              return {
                'current/pl': { path: category_link(::MapawynajmuPl::Announcement::CATEGORIES[category], :pl) },
                'current/en': { path: category_link(::MapawynajmuPl::Announcement::CATEGORIES[category], :en) }
              }
            end

            {
              'current/pl': { path: lang_prefix(:pl).chomp('/') },
              'current/en': { path: lang_prefix(:en) }
            }
          end

          def category_links
            category_links_hash = {}

            ::MapawynajmuPl::Announcement::CATEGORIES.each_value do |category|
              category_links_hash["root/#{category[:trackified]}"] = {
                path: category_link(category, lang)
              }
            end

            category_links_hash
          end

          private

          def category_link(category, lang)
            "#{category_prefix(lang)}/#{category[:plural_urlified][lang]}"
          end

          def lang_prefix(lang)
            lang == :pl ? '' : 'en'
          end

          def category_prefix(lang)
            lang == :pl ? 'wynajem' : 'rent'
          end
        end
      end
    end
  end
end
