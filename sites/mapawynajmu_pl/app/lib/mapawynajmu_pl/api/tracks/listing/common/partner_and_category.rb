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
                href = "#{partner_path_with_slash(lang)}#{category_link(category, lang)}"
                category_links_hash["listing/index/#{category[:trackified]}"] = {
                  href: "/#{href}",
                  # TODO: Add hrefLang, title and label.
                }
              end

              category_links_hash
            end

            private

            def match_data
              @match_data ||= unlocalized_path[lang].match(url)
            end

            def current_partner
              @current_partner ||= begin
                urlified_business_name = match_data && match_data[:current_partner_name]
                return if urlified_business_name.blank?

                ::MapawynajmuPl::User.find_by!(urlified_business_name: urlified_business_name)
              end
            end

            def current_category
              @current_category ||= begin
                current_category_name = match_data && match_data[:current_category_name]
                return if current_category_name.blank?

                ::MapawynajmuPl::Listing::CATEGORIES.each do |key, value|
                  return key if value[:urlified_plural][lang] == current_category_name
                end
              end
            end

            def current_partner_path(lang)
              {
                pl: "partnerzy/#{current_partner.urlified_business_name}",
                en: "partners/#{current_partner.urlified_business_name}",
              }[lang]
            end

            def current_category_path(lang)
              category_link(::MapawynajmuPl::Listing::CATEGORIES[current_category], lang)
            end

            def category_link(category, lang)
              "#{category_prefix(lang)}/#{category[:urlified_plural][lang]}"
            end

            def category_prefix(lang)
              lang == :pl ? 'wynajem' : 'rent'
            end

            def partner_path_with_slash(lang)
              return nil if current_partner.nil?

              "#{current_partner_path(lang)}/"
            end

            def category_path_with_slash(lang)
              return nil if current_category.nil?

              "#{current_category_path(lang)}/"
            end
          end
        end
      end
    end
  end
end
