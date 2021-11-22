# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module Title
      def title(lang)
        @lang = lang

        case lang
        when :pl
          "#{category_for_title} do wynajęcia"
        when :en
          "#{category_for_title} for lease"
        end
      end

      private

      attr_reader :lang

      def category_for_title
        ::Warsawlease::Announcement::CATEGORIES[category][:name][lang]
      end
    end
  end
end
