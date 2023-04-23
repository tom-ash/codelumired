# frozen_string_literal: true

module MapawynajmuPl
  module ListingModule
    module Description
      def description(lang)
        @lang = lang

        { pl: polish_description, en: english_description }[lang]
      end

      attr_reader :lang

      def polish_description
        "#{titleized_category} do wynajęcia#{located_at}#{with_area_and_monthly_price}. | #{MAPAWYNAJMU_PL_NAME} - ogłoszenia wynajmu nieruchomości."
      end

      def english_description
        "#{titleized_category} for rent#{located_at}#{with_area_and_monthly_price}. | #{MAPAWYNAJMU_PL_NAME} - real estate lease announcements."
      end

      def located_at
        return if locality.blank? && sublocality.blank?
        return ", #{locality}, #{sublocality}," if locality.present? && sublocality.present?

        ", #{locality},"
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
