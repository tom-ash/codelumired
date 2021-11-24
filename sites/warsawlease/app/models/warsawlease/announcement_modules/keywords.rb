# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module Keywords
      def keywords(lang)
        @lang = lang

        keywords_array = [
          titleized_category.downcase,
          titleized_district.downcase,
          titleized_city.downcase,
          lease_keywords
        ]
        keywords_array.join(', ')
      end

      private

      attr_reader :lang

      def lease_keywords
        {
          pl: 'wynajem, wynajmu, najem, najmu, wynajęcie, wynajęcia',
          en: 'lease, rent'
        }[lang]
      end
    end
  end
end
