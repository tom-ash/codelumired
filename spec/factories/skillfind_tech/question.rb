# frozen_string_literal: true

FactoryBot.define do
  factory :question, class: ::SkillfindTech::Question do
    category { create(:category) }
    lang { 'en' }
    question_type { 'singleChoice' }
    url { 'test' }
    title { 'test_title' }
    body { 'test_body' }
    hint { 'test_hint' }
    after(:create) do |question|
      create(
        :question_answer,
        question: question,
        position: 0,
        body: 'body_a',
        is_correct: false,
        explanation: 'explanation_a',
      )
      create(
        :question_answer,
        question: question,
        position: 1,
        body: 'body_b',
        is_correct: true,
        explanation: 'explanation_b',
      )
      create(
        :question_answer,
        question: question,
        position: 2,
        body: 'body_c',
        is_correct: false,
        explanation: 'explanation_c',
      )
      create(
        :question_answer,
        question: question,
        position: 3,
        body: 'body_d',
        is_correct: false,
        explanation: 'explanation_d',
      )
    end
  end
end
