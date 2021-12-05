# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          module Meta
            TRACK = 'visitor/privacy-settings'

            UNLOCALIZED_PATH = {
              en: 'privacy-settings'
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Privacy Settings'
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
                en: 'privacy settings, soundof.IT, IT, dev, programming, board, job, knowledge, repository'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Privacy Settings of soundof.IT, an IT skill driven job board & knowledge repository.'
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/privacy-settings': true
              }
            end

            def links
              {
                'current/en': ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
