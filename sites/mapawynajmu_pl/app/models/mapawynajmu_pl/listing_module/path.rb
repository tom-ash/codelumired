# frozen_string_literal: true

module MapawynajmuPl
  module ListingModule
    module Path
      def url(lang)
        @lang = lang.to_sym

        components = [
          id,
          urlified_name,
          urlified_category,
          for_lease,
          urlified_locality,
          urlified_sublocality
        ].compact

        components.join('-')
      end

      attr_reader :lang

      def urlified_category
        ::MapawynajmuPl::Listing::CATEGORIES[category][:urlified][lang]
      end

      def for_lease
        { pl: 'na-wynajem', en: 'for-lease' }[lang]
      end

      def urlified_locality
        locality&.parameterize
      end

      def urlified_sublocality
        sublocality&.parameterize
      end

      def urlified_name
        return if name.blank?

        name.parameterize
      end
    end
  end
end
