# frozen_string_literal: true

module SoundofIt
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
                en: 'terms of service, soundof.IT, IT, dev, programming, board, job, knowledge, repository'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Terms of Service of soundof.IT, an IT skill driven job board & knowledge repository.'
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
                'current/en': ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
