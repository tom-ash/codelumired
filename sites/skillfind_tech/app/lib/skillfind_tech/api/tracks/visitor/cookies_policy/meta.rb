# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          module Meta
            TRACK = 'visitor/cookies-policy'

            UNLOCALIZED_PATH = {
              en: 'cookies-policy',
              pl: 'polityka-cookies',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Cookies Policy',
              pl: 'Polityka Cookies',
            }.freeze

            PRIORITY = '0.5'

            CHANGE_FREQ = 'monthly'

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
                en: 'cookies policy, skillfind.tech, IT, dev, programming, board, job, knowledge, repository',
                # TODO: Add :pl!
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Cookies Policy of skillfind.tech, an IT skill driven job board & knowledge repository.',
                # TODO: Add :pl!
              }.freeze
            end

            def render
              {
                'visitor': true,
                'visitor/cookies-policy': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
