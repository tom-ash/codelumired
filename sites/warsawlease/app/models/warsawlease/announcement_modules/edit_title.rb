# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module EditTitle
      def edit_title(lang)
        @lang = lang.to_sym

        "#{lang == :pl ? 'Edytuj ogłoszenie nr' : 'Edit Announcement No.'} #{id}"
      end

      attr_reader :lang
    end
  end
end
