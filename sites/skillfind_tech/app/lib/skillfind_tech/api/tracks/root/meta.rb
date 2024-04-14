# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        module Meta
          TRACK = 'root'

          UNLOCALIZED_PATH = {
            en: '/',
            pl: 'pl',
          }.freeze

          UNLOCALIZED_TITLE = {
            en: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
            pl: 'skillfind.tech | Tablica ogłoszeń IT z umiejętnościami i repozytorium wiedzy',
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
              en: 'skillfind.tech, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet',
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              en: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
            }.freeze
          end

          def render
            {
              visitor: true,
              # page: true,
              # 'page/show': true,
              postings: true,
              'postings/index': true,
              renderVisitorPageIndex: true,
            }
          end

          def links
            {
              'current/en': ::SkillfindTech::Api::Tracks::Root::Linker.new(:en).call,
              'current/pl': ::SkillfindTech::Api::Tracks::Root::Linker.new(:pl).call,
            }
          end
        end
      end
    end
  end
end
