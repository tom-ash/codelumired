# frozen_string_literal: true

FactoryBot.define do
  factory :question, class: ::SkillfindTech::Question do
    lang { 'en' }
    question_type { 'singleChoice' }
    url { 'test' }
    title { 'test_title' }
    body { 'test_body' }
    hint { 'test_hint' }
    explanation { 'test_explanation' }
    after(:create) do |question|
      create(:question_answer, question: question, sequence_letter: 'a', body: 'body_a', is_correct: false)
      create(:question_answer, question: question, sequence_letter: 'b', body: 'body_b', is_correct: true)
      create(:question_answer, question: question, sequence_letter: 'c', body: 'body_c', is_correct: false)
      create(:question_answer, question: question, sequence_letter: 'd', body: 'body_d', is_correct: false)
    end
  end
end
