# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Visitor
        module Contact
          module Meta
            TRACK = 'visitor/contact'

            UNLOCALIZED_PATH = {
              en: 'contact'
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Contact'
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
                en: 'contact, soundof.IT, IT, dev, programming, board, job, knowledge, repository'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Contact to soundof.IT, an IT skill driven job board & knowledge repository.'
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/contact': true
              }
            end

            def links
              {
                'current/en': ::SoundofIt::Api::Tracks::Visitor::Contact::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
