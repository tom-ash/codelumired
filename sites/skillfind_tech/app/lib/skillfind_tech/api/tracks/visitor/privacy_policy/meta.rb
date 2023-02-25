# frozen_string_literal: true

module SkillfindTech
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
                en: 'privacy policy, skillfind.tech, IT, dev, programming, board, job, knowledge, repository',
                # TODO: Add :pl.
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Privacy Policy of skillfind.tech, an IT skill driven job board & knowledge repository.',
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
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
