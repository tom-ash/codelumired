# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module PrivacySettings
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Ustawienia Prywatności',
              en: 'Privacy Settings'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'ustawienia prywatności, soundof.IT',
                en: 'privacy settings, soundof.IT'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Ustawwienia Prywatności soundof.IT.',
                en: 'Privacy Settings of soundof.IT.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
