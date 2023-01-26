# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Linker
          include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
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
              pl: { path: ROOT_PL },
              en: { path: ROOT_EN },
            }[lang]
          end

          def lang_links
            return partner_and_category_paths if partner.present? && category.present?
            return partner_paths if partner.present?
            return category_paths if category.present?

            root_paths
          end

          def partner_and_category_paths
            {
              'current/pl': { path: "#{partner_path(:pl)}/#{category_path(:pl)}" },
              'current/en': { path: "#{partner_path(:en)}/#{category_path(:en)}" },
            }
          end

          def partner_paths
            {
              'current/pl': { path: partner_path(:pl) },
              'current/en': { path: partner_path(:en) },
            }
          end

          def category_paths
            {
              'current/pl': { path: category_path(:pl) },
              'current/en': { path: category_path(:en) },
            }
          end

          def root_paths
            {
              'current/pl': { path: ROOT_PL.chomp('/') },
              'current/en': { path: ROOT_EN },
            }
          end

          def partner_path(lang)
            {
              pl: "partnerzy/#{partner.urlified_business_name}",
              en: "partners/#{partner.urlified_business_name}",
            }[lang]
          end

          def category_path(lang)
            category_link(::MapawynajmuPl::Announcement::CATEGORIES[category], lang)
          end

          def category_links
            category_links_hash = {}

            ::MapawynajmuPl::Announcement::CATEGORIES.each_value do |category|
              category_path = category_link(category, lang)

              category_links_hash["root/#{category[:trackified]}"] = {
                path: partner.present? ? "#{partner_path(lang)}/#{category_path}" : category_path,
              }
            end

            category_links_hash
          end

          private

          def category_link(category, lang)
            "#{category_prefix(lang)}/#{category[:urlified_plural][lang]}"
          end

          def category_prefix(lang)
            lang == :pl ? 'wynajem' : 'rent'
          end
        end
      end
    end
  end
end
