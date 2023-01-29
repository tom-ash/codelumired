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
            return lang_links_with_current_partner_and_current_category if current_partner.present? && current_category.present?
            return lang_links_with_current_partner if current_partner.present?
            return lang_links_with_current_category if current_category.present?

            root_paths
          end

          private

          def lang_links_with_current_partner_and_current_category
            {
              'current/pl': { path: "#{current_partner_path(:pl)}/#{current_category_path(:pl)}" },
              'current/en': { path: "#{current_partner_path(:en)}/#{current_category_path(:en)}" },
            }
          end

          def lang_links_with_current_partner
            {
              'current/pl': { path: current_partner_path(:pl) },
              'current/en': { path: current_partner_path(:en) },
            }
          end

          def lang_links_with_current_category
            {
              'current/pl': { path: current_category_path(:pl) },
              'current/en': { path: current_category_path(:en) },
            }
          end

          def root_paths
            {
              'current/pl': { path: ROOT_PL.chomp('/') },
              'current/en': { path: ROOT_EN },
            }
          end
        end
      end
    end
  end
end
