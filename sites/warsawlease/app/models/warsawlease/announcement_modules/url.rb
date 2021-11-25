# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module Url
      def url(lang)
        @lang = lang

        "#{root_domain}/#{id}-#{urlified_category}-#{for_lease}-#{urlified_city}-#{urlified_district}"
      end

      attr_reader :lang

      def urlified_category
        ::Warsawlease::Announcement::CATEGORIES[category][:urlified][lang]
      end

      def for_lease
        { pl: 'na-wynajem', en: 'for-lease' }[lang]
      end

      def urlified_city
        ::Warsawlease::Announcement::CITY[lang].downcase
      end

      def urlified_district
        ::Warsawlease::Announcement::DISTRICTS[category][:urlified]
      end

      def root_domain
        return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

        'https://www.warsawlease.pl'
      end
    end
  end
end
