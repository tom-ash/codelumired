# frozen_string_literal: true

module Warsawlease
  module Api
    module RouteData
      extend Grape::API::Helpers

      private

      def route_data
        {
          '/': { track: 'root', lang: :pl },
          'en': { track: 'root', lang: :en },
          'dodaj-ogloszenie-wynajmu-nieruchomosci-w-warszawie': { track: 'announcement/create', lang: :pl },
          'add-announcement-of-real-estate-lease-in-warsaw': { track: 'announcement/create', lang: :en }
        }
      end

      def root_domain
        'https://www.warsawlease.pl'
      end
    end
  end
end
