# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module TermsOfService
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Regulamin',
              en: 'Terms of Service'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'regulamin, soundof.IT, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'terms of service, soundof.IT, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Regulamin soundof.IT, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Terms of Service of soundof.IT, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
