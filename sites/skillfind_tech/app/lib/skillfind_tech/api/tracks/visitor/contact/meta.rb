# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module Contact
          module Meta
            TRACK = 'visitor/contact'

            UNLOCALIZED_PATH = {
              en: 'contact',
              pl: 'kontakt',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Contact',
              pl: 'Kontakt',
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
                en: 'contact, skillfind.tech, IT, dev, programming, board, job, knowledge, repository',
                # TODO: Add :pl!
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'Contact to skillfind.tech, an IT skill driven job board & knowledge repository.',
                # TODO: Add :pl!
              }.freeze
            end

            def render
              {
                'visitor': true,
                'visitor/contact': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::Contact::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::Contact::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
