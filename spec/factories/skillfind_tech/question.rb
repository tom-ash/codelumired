# frozen_string_literal: true

FactoryBot.define do
  factory :question, class: ::SkillfindTech::Question do
    lang { 'en' }
    url { 'test' }
    title { 'test_title' }
    body { 'test_body' }
    hint { 'test_hint' }
    explanation { 'test_explanation' }
  end
end

# create_table "question_answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
#   t.uuid "question_id", null: false
#   t.string "sequence_letter", null: false
#   t.string "body", null: false
#   t.boolean "is_correct", default: false, null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["question_id"], name: "index_question_answers_on_question_id"
# end

# create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
#   t.string "lang", null: false
#   t.string "url", null: false
#   t.string "title", null: false
#   t.string "body", null: false
#   t.jsonb "hint", null: false
#   t.string "explanation", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["url"], name: "index_questions_on_url", unique: true
# end