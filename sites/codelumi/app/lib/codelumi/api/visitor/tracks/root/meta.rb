# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module Root
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'TODO',
              en: 'soundof.IT | IT Skill Driven Job Board & Knowledge Repository'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'TODO',
                en: 'soundof.IT, sound of it, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'TODO',
                en: 'soundof.IT is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
