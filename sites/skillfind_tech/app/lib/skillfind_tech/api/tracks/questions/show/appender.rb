# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Questions
        module Show
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Questions::Show::Meta

            private

            def data
              match_data
              {
                title: question.title,
                type: type,
                body: question.body,
                answers: answers,
                hint: question.hint,
                explanation: question.explanation,
                isSubmitted: false,
                isAnsweredCorrectly: nil,
                isSingleChoice: type == 'singleChoice',
                isMultipleChoice: type == 'multipleChoice',
                isAnyAnswerSelected: false,
              }
            end

            def question
              @question ||= ::SkillfindTech::Question.find_by(url: question_path)
            end

            def type
              @type ||= begin
                correctAnswers = answers.select { |answer| answer[:isCorrect] }

                correctAnswers.count == 1 ? 'singleChoice' : 'multipleChoice'
              end
            end

            def question_path
              @question_path ||= match_data[:question_path]
            end

            def answers
              question.answers.map do |answer|
                {
                  sequenceLetter: answer.sequence_letter,
                  body: answer.body,
                  isCorrect: answer.is_correct,
                  isSelected: false,
                }
              end
            end

            def asset_names
              @asset_names ||= %i[
                retry
                dice
                send
                paperPlane
                check
              ]
            end
          end
        end
      end
    end
  end
end
