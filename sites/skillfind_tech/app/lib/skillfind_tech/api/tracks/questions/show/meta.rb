# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Questions
        module Show
          module Meta
            TRACK = 'questionsShow'

            UNLOCALIZED_PATH = {
              pl: /^((?<category_path>.+)\/)?pytania\/(?<question_path>.+)$/,
              en: /^((?<category_path>.+)\/)?questions\/(?<question_path>.+)$/,
            }.freeze
  
            UNLOCALIZED_TITLE = {
              en: 'TODO',
              pl: 'TODO',
            }.freeze
  
            private
  
            def track
              @track ||= TRACK
            end

            def match_data
              @match_data ||= unlocalized_path[lang].match(url)
            end
  
            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end
              
            def title
              question.title
            end

            def description
              @description ||= question.description
            end
  
            def keywords
              nil
            end
  
            def render
              {
                visitor: true,
                renderQuestions: true,
                renderQuestionsShow: true,
              }
            end
  
            def links
              {
                'current/en': { href: '/TODO' },
                'current/pl': { href: '/TODO' },
              }
            end
          end
        end
      end
    end
  end
end
