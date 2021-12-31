# frozen_string_literal: true

module MapawynajmuPl
  module AnnouncementModules
    module Path
      def url(lang)
        @lang = lang.to_sym

        "#{id}-#{urlified_category}-#{for_lease}-#{urlified_city}-#{urlified_district}"
      end

      attr_reader :lang

      def urlified_category
        ::MapawynajmuPl::Announcement::CATEGORIES[category][:urlified][lang]
      end

      def for_lease
        { pl: 'na-wynajem', en: 'for-lease' }[lang]
      end

      def urlified_city
        ::MapawynajmuPl::Announcement::CITY[lang].downcase
      end

      def urlified_district
        ::MapawynajmuPl::Announcement::DISTRICTS[category][:urlified]
      end
    end
  end
end
