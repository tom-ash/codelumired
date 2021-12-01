# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module EditUrl
      def edit_url(lang)
        @lang = lang.to_sym

        "#{lang == :pl ? 'edytuj-ogloszenie' : 'edit-announcement'}/#{id}"
      end

      private

      attr_reader :lang
    end
  end
end
