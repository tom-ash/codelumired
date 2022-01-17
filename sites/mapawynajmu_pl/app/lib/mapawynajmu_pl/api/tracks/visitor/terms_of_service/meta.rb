# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          module Meta
            TRACK = 'visitor/terms-of-service'

            UNLOCALIZED_PATH = {
              pl: 'regulamin',
              en: 'terms-of-service'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Regulamin',
              en: 'Terms of Service'
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: "regulamin, #{MAPAWYNAJMU_PL_APP_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "terms of service, #{MAPAWYNAJMU_PL_APP_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Regulamin #{MAPAWYNAJMU_PL_APP_NAME}, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Terms of Service of #{MAPAWYNAJMU_PL_APP_NAME}, a service featuring real estate lease announcements in Warsaw."
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/terms-of-service': true
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
