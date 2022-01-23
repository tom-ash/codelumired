# frozen_string_literal: true

module MapawynajmuPl
  module AnnouncementModules
    module Path
      def url(lang)
        @lang = lang.to_sym

        "#{id}-#{urlified_category}-#{for_lease}-#{urlified_locality}-#{urlified_sublocality}"
      end

      attr_reader :lang

      def urlified_category
        ::MapawynajmuPl::Announcement::CATEGORIES[category][:urlified][lang]
      end

      def for_lease
        { pl: 'na-wynajem', en: 'for-lease' }[lang]
      end

      def urlified_locality
        locality.parameterize
      end

      def urlified_sublocality
        sublocality.parameterize
      end
    end
  end
end
