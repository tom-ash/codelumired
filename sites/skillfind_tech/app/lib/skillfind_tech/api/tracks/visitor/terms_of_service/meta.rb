# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          module Meta
            TRACK = 'visitor/terms-of-service'

            UNLOCALIZED_PATH = {
              en: 'terms-of-service',
              pl: 'regulamin',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Terms of Service',
              pl: 'Regulamin',
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
                en: 'terms of service, skillfind.tech, IT, dev, programming, board, job, knowledge, repository',
                # TODO: Add :pl.
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Terms of Service of skillfind.tech, an IT skill driven job board & knowledge repository.',
                # TODO: Add :pl.
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
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
