# frozen_string_literal: true

module Codelumi
  module Api
    module RouteData
      extend Grape::API::Helpers

      ROUTE_DATA = {
        'root': {
          pl: '/',
          en: 'en'
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

      def route_data
        @route_data ||= ROUTE_DATA
      end

      def root_domain
        return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

        'https://www.warsawlease.pl'
      end
    end
  end
end
