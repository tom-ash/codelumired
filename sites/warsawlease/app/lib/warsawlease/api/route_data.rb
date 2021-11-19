# frozen_string_literal: true

module Warsawlease
  module Api
    module RouteData
      extend Grape::API::Helpers

      private

      def route_data
        {
          'root': {
            pl: '/',
            en: 'en'
          },
          'announcement/create': {
            pl: 'dodaj-ogloszenie-wynajmu-nieruchomosci-w-warszawie',
            en: 'add-announcement-of-real-estate-lease-in-warsaw'
          }
        }
      end

      def root_domain
        'https://www.warsawlease.pl'
      end
    end
  end
end
