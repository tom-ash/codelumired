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
                body: question.body,
                answers: question.answers,
                hint: question.hint,
                explanation: question.explanation,
              }
            end

            def question
              @question ||= ::SkillfindTech::Question.find_by(url: question_path)
            end

            def question_path
              @question_path ||= match_data[:question_path]
            end
          end
        end
      end
    end
  end
end
