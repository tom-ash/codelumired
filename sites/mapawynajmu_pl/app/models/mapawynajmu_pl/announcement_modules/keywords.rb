# frozen_string_literal: true

module MapawynajmuPl
  module ListingModule
    module Keywords
      def keywords(lang)
        @lang = lang

        keywords_array = [
          titleized_category.downcase,
          sublocality&.downcase,
          locality&.downcase,
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
