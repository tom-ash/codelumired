# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          module Meta
            TRACK = 'visitor/privacy-settings'

            UNLOCALIZED_PATH = {
              en: 'privacy-settings',
              pl: 'ustawienia-prywatnosci',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Privacy Settings',
              pl: 'Ustawienia prywatności',
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
                en: 'privacy settings, skillfind.tech, IT, dev, programming, board, job, knowledge, repository',
                # TODO: Add :pl.
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Privacy Settings of skillfind.tech, an IT skill driven job board & knowledge repository.',
                # TODO: Add :pl.
              }.freeze
            end

            def render
              {
                'visitor': true,
                'visitor/privacy-settings': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
