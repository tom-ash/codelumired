# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Common
          module PartnerAndCategory
            FOR_LEASE = { pl: 'na wynajem', en: 'for rent' }.freeze

            def category_links
              category_links_hash = {}

              ::MapawynajmuPl::Listing::CATEGORIES.each_value do |category|
                path = get_localized_path_prefix(category, lang)
                href = "/#{path}"

                category_links_hash["listing/index/#{category[:trackified]}"] = {
                  href: href,
                  # TODO: Add hrefLang, title and label.
                }
              end

              category_links_hash
            end

            private

            def get_localized_path_prefix(category, lang)
              partner_path = get_localized_partner_path(lang)
              category_path = get_localized_category_path(category, lang)
              path_elements = []
              path_elements.push("#{partner_path}/") if partner_path.present?
              path_elements.push(category_path)
              path_elements.join
            end

            def get_localized_partner_path(lang)
              return if partner_from_path.nil?

              {
                pl: "partnerzy/#{partner_from_path.urlified_business_name}",
                en: "partners/#{partner_from_path.urlified_business_name}",
              }[lang]
            end

            def get_localized_category_path(category, lang)
              return if category.nil?

              "#{category_prefix(lang)}/#{category[:urlified_plural][lang]}"
            end

            def partner_from_path
              @partner_from_path ||= begin
                urlified_business_name = match_data && match_data[:current_partner_name]
                return if urlified_business_name.blank?

                ::MapawynajmuPl::User.find_by!(urlified_business_name: urlified_business_name)
              end
            end

            def category_from_path
              @category_from_path ||= begin
                current_category_name = match_data && match_data[:current_category_name]
                return if current_category_name.blank?

                ::MapawynajmuPl::Listing::CATEGORIES.each do |key, value|
                  return value.merge(integerSymbol: key) if value[:urlified_plural][lang] == current_category_name
                end
              end
            end

            def category_prefix(lang)
              lang == :pl ? 'wynajem' : 'rent'
            end

            def match_data
              @match_data ||= unlocalized_path[lang].match(url)
            end

            def get_root_path(lang)
              return '' if lang == :pl
  
              ::MapawynajmuPl::Api::Tracks::Root::Meta::ROOT_EN
            end
          end
        end
      end
    end
  end
end
