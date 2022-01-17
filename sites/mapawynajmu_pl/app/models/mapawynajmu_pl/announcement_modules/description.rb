# frozen_string_literal: true

module MapawynajmuPl
  module AnnouncementModules
    module Description
      def description(lang)
        @lang = lang

        { pl: polish_description, en: english_description }[lang]
      end

      attr_reader :lang

      def polish_description
        "#{titleized_category} do wynajęcia #{located_at_district}#{with_area_and_monthly_price}. | #{MAPAWYNAJMU_PL_APP_NAME} - ogłoszenia wynajmu nieruchomości w Warszawie."
      end

      def english_description
        "#{titleized_category} for lease #{located_at_district}#{with_area_and_monthly_price}. | #{MAPAWYNAJMU_PL_APP_NAME} - real estate lease announcements in Warsaw."
      end

      def located_at_district
        ::MapawynajmuPl::Announcement::DISTRICTS[category][:location][lang]
      end

      def with_area_and_monthly_price
        return "#{with_area}#{lang == :pl ? ' oraz' : ' and'}#{with_monthly_gross_rent}" if area.present? && gross_rent_amount.present?
        return with_area if area.present?

        with_monthly_gross_rent
      end

      def with_area
        {
          pl: " o powierzchni #{area} m2",
          en: " with area of #{area} sqm"
        }[lang]
      end

      def with_monthly_gross_rent
        {
          pl: " o miesięcznej cenie #{gross_rent_amount} PLN",
          en: " with monthly price of #{gross_rent_amount} PLN"
        }[lang]
      end
    end
  end
end
