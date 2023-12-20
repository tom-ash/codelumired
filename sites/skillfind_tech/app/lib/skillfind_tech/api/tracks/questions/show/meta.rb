# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Questions
        module Show
          module Meta
            TRACK = 'questionsShow'

            UNLOCALIZED_PATH = {
              en: /^((?<category_path>.+)\/)?practice-problems\/(?<question_path>.+)$/,
              pl: /^((?<category_path>.+)\/)?cwiczenia\/(?<question_path>.+)$/,
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
                hasPart: {
                  '@type': 'Question',
                  eduQuestionType: eduQuestionType,
                  educationalAlignment: [
                    {
                      '@type': 'AlignmentObject',
                      alignmentType: 'educationalSubject',
                      targetName: 'Programming',
                    },
                    {
                      '@type': 'AlignmentObject',
                      alignmentType: 'educationalSubject',
                      targetName: 'Software Engineering',
                    },
                    {
                      '@type': 'AlignmentObject',
                      alignmentType: 'educationalSubject',
                      targetName: category.en,
                    },
                  ],
                  typicalAgeRange: '15-99',
                  educationalLevel: educationalLevel,
                  # REQ assesses
                  comment: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: question.hint,
                  },
                  learningResourceType: 'Practice problem',
                  name: question.title,
                  encodingFormat: "text/markdown",
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
                  comment: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: answer.hint,
                  },
                  answerExplanation: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: answer.explanation,
                  }
                )
              end

              return built_answers[0] if built_answers.count == 1

              built_answers
            end

            def educationalLevel
              {
                easy: 'beginner',
                medium: 'intermediate',
                hard: 'advanced',
              }[question.difficulty.to_sym]
            end
          end
        end
      end
    end
  end
end
