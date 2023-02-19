# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          module Meta
            TRACK = 'visitor/privacy-policy'

            UNLOCALIZED_PATH = {
              en: 'privacy-policy',
              pl: 'polityka-prywatnosci',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Privacy Policy',
              pl: 'Polityka prywatności',
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
                en: 'privacy policy, soundof.IT, IT, dev, programming, board, job, knowledge, repository',
                # TODO: Add :pl.
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Privacy Policy of soundof.IT, an IT skill driven job board & knowledge repository.',
                # TODO: Add :pl.
              }.freeze
            end

            def render
              {
                'visitor': true,
                'visitor/privacy-policy': true,
              }
            end

            def links
              {
                'current/en': ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:en).call,
                'current/pl': ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
