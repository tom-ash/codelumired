# frozen_string_literal: true

module MapawynajmuPl
  module AnnouncementModules
    module Title
      def title(lang)
        @lang = lang

        title_array = [
          "#{titleized_category}#{titleized_for_lease}",
          titleized_district,
          titleized_city,
          titleized_area,
          titleized_rent,
        ].compact
        title_array.join(', ')
      end

      attr_reader :lang

      def titleized_category
        ::MapawynajmuPl::Announcement::CATEGORIES[category][:name][lang]
      end

      def titleized_city
        ::MapawynajmuPl::Announcement::CITY[lang]
      end

      def titleized_district
        ::MapawynajmuPl::Announcement::DISTRICTS[category][:name]
      end

      def titleized_area
        return if area.blank?

        "#{area} #{lang == :pl ? 'm2' : 'sqm'}"
      end

      def titleized_rent
        return if gross_rent_amount.blank?

        "#{gross_rent_amount} PLN"
      end

      private

      def titleized_for_lease
        { pl: ' do wynajęcia', en: ' for lease' }[lang]
      end
    end
  end
end
