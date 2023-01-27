# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Common
          module PartnerAndCategory
            FOR_LEASE = { pl: 'na wynajem', en: 'for rent' }.freeze

            private

            def match_data
              @match_data ||= unlocalized_path[lang].match(url)
            end

            def partner
              @partner ||= begin
                urlified_business_name = match_data && match_data[:partner_name]
                return if urlified_business_name.blank?

                ::MapawynajmuPl::User.find_by!(urlified_business_name: urlified_business_name)
              end
            end

            def category
              @category ||= begin
                category_name = match_data && match_data[:category_name]
                return if category_name.blank?

                ::MapawynajmuPl::Announcement::CATEGORIES.each do |key, value|
                  return key if value[:urlified_plural][lang] == category_name
                end
              end
            end

            def partner_paths
              {
                'current/pl': { path: partner_path(:pl) },
                'current/en': { path: partner_path(:en) },
              }
            end

            def partner_path(lang)
              {
                pl: "partnerzy/#{partner.urlified_business_name}",
                en: "partners/#{partner.urlified_business_name}",
              }[lang]
            end

            def category_title
              "#{::MapawynajmuPl::Announcement::CATEGORIES[category][:name_plural][lang]} #{FOR_LEASE[lang]}"
            end
          end
        end
      end
    end
  end
end
