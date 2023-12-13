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

            def schema_org
              @schema_org ||= {
                '@context': 'https://schema.org',
                "@graph": [
                  organization,
                  # webSiteSchemaOrg,
                  questionSchemaOrg,
                  # primarySchemaOrg.merge(authorSchemaOrg),
                  # breadcrumbsSchemaOrg,
                ]
              }
            end

            # https://developers.google.com/search/docs/appearance/structured-data/practice-problems#one-question-checkbox
            def questionSchemaOrg
              {
                '@type': 'Quiz',
                name: question.title,
                # about
                # educationalLevel
                # assesses
                hasPart: {
                  '@type': 'Question',
                  eduQuestionType: eduQuestionType,
                  learningResourceType: 'Practice problem',
                  name: question.title,
                  encodingFormat: "text/markdown",
                  # typicalAgeRange
                  text: question.body,
                  suggestedAnswer: buildSchemaOrgAnswers(question.answers.where(is_correct: false).sort_by(&:position)),
                  acceptedAnswer: buildSchemaOrgAnswers(question.answers.where(is_correct: true).sort_by(&:position)),
                }
              }
            end

            def eduQuestionType
              @eduQuestionType ||= question.question_type == 'singleChoice' ? 'Multiple choice' : 'Checkbox'
            end

            def buildSchemaOrgAnswers(answers)
              built_answers = []

              answers.map do |answer|
                built_answers.push(
                  '@type': 'Answer',
                  position: answer.position,
                  encodingFormat: 'text/markdown',
                  text: answer.body,
                  answerExplanation: {
                    '@type': 'Comment',
                    text: answer.explanation,
                  }
                )
              end

              return built_answers[0] if built_answers.count == 1

              built_answers
            end
          end
        end
      end
    end
  end
end
