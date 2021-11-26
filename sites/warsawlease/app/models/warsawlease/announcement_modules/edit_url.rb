# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module EditUrl
      def edit_url(lang)
        @lang = lang.to_sym

        "#{root_domain}/#{lang == :pl ? 'edytuj-ogloszenie' : 'edit-announcement'}/#{id}"
      end

      attr_reader :lang

      def root_domain
        return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

        'https://www.warsawlease.pl'
      end
    end
  end
end
