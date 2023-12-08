# frozen_string_literal: true

FactoryBot.define do
  factory :question_answer, class: ::SkillfindTech::QuestionAnswer do
    question { create(:question) }
    position { 0 }
    body { 'test' }
    is_correct { false }
    explanation { 'test_explanation' }
  end
end
