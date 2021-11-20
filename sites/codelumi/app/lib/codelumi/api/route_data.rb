# frozen_string_literal: true

module Codelumi
  module Api
    module RouteData
      extend Grape::API::Helpers

      ROUTE_DATA = {
        ::Codelumi::Api::Tracks::Root::Meta::TRACK => ::Codelumi::Api::Tracks::Root::Meta::UNLOCALIZED_PATH,
        'visitor/contact': {
          pl: 'kontakt',
          en: 'contact'
        },
        'visitor/terms-of-service': {
          pl: 'regulamin',
          en: 'terms-of-service'
        },
        'visitor/cookies-policy': {
          pl: 'polityka-cookies',
          en: 'cookies-policy'
        },
        'visitor/privacy-policy': {
          pl: 'polityka-prywatnosci',
          en: 'privacy-policy'
        },
        'visitor/privacy-settings': {
          pl: 'ustawienia-prywatnosci',
          en: 'privacy-settings'
        }
      }

      private

      def track_paths
        @track_paths ||= ROUTE_DATA
      end

      def root_domain
        return 'http://local.soundof.it:8080' if Rails.env == 'development'

        'https://soundof.it'
      end
    end
  end
end
