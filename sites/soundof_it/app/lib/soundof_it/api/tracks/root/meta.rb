# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Root
        module Meta
          TRACK = 'root'

          UNLOCALIZED_PATH = {
            en: '/',
            pl: '/pl',
          }.freeze

          UNLOCALIZED_TITLE = {
            en: 'soundof.IT | IT Skill Driven Job Board & Knowledge Repository',
            pl: 'soundof.IT | Tablica ogłoszeń IT z umiejętnościami i repozytorium wiedzy',
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
              en: 'soundof.IT, sound of it, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet',
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              en: 'soundof.IT is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
            }.freeze
          end

          def asset_names
            @asset_names ||= %i[chevron calendar]
          end

          def render
            {
              visitor: true,
              page: true,
            }
          end

          def links
            {
              'current/en': ::SoundofIt::Api::Tracks::Root::Linker.new(:en).call,
              'current/pl': ::SoundofIt::Api::Tracks::Root::Linker.new(:pl).call,
            }
          end
        end
      end
    end
  end
end
