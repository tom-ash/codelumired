# frozen_string_literal: true

FactoryBot.define do
  factory :question_answer, class: ::SkillfindTech::QuestionAnswer do
    question { create(:question) }
    sequence_letter { 'a' }
    body { 'test' }
    is_correct { false }
  end
end
