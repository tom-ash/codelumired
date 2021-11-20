# frozen_string_literal: true

module Warsawlease
  module Api
    module RouteData
      extend Grape::API::Helpers

      ROUTE_DATA = {
        'root': {
          pl: '/',
          en: 'en'
        },
        'announcement/create': {
          pl: 'dodaj-ogloszenie-wynajmu-nieruchomosci-w-warszawie',
          en: 'add-announcement-of-real-estate-lease-in-warsaw'
        },
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
        return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

        'https://www.warsawlease.pl'
      end
    end
  end
end
