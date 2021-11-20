# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Root
        module Meta
          TRACK = 'root'

          UNLOCALIZED_PATH = {
            en: '/'
          }

          UNLOCALIZED_TITLE = {
            en: 'soundof.IT | IT Skill Driven Job Board & Knowledge Repository'
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
              en: 'soundof.IT, sound of it, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              en: 'soundof.IT is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.'
            }.freeze
          end
        end
      end
    end
  end
end
