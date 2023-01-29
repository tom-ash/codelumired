# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Common
          module PartnerAndCategory
            FOR_LEASE = { pl: 'na wynajem', en: 'for rent' }.freeze

            def category_links
              partner_path = current_partner.present? ? "#{current_partner_path(lang)}/" : ''

              category_links_hash = {
                'listing/index/all-categories': { path: partner_path.chomp('/') },
              }

              ::MapawynajmuPl::Announcement::CATEGORIES.each_value do |category|
                current_category_path = category_link(category, lang)

                category_links_hash["listing/index/#{category[:trackified]}"] = {
                  path: "#{partner_path}#{current_category_path}",
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

                ::MapawynajmuPl::Announcement::CATEGORIES.each do |key, value|
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
              category_link(::MapawynajmuPl::Announcement::CATEGORIES[current_category], lang)
            end

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
end
