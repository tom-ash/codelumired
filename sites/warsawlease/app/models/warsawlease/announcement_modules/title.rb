# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module Title
      def title(lang)
        @lang = lang

        "#{titleized_category}#{titleized_for_lease}#{titleized_district}#{titleized_area}#{titleized_rent}"
      end

      private

      attr_reader :lang

      def titleized_category
        ::Warsawlease::Announcement::CATEGORIES[category][:name][lang]
      end

      def titleized_for_lease
        { pl: ' do wynajęcia, Warszawa ', en: ' for lease, Warsaw ' }[lang]
      end

      def titleized_district
        ::Warsawlease::Announcement::DISTRICTS[category][:name]
      end

      def titleized_area
        return if area.blank?

        ", #{area} #{lang == :pl ? 'm2' : 'sqm'}"
      end

      def titleized_rent
        return if gross_rent_amount.blank?

        ", #{gross_rent_amount} PLN"
      end
    end
  end
end
