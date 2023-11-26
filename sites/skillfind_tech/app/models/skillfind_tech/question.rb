# frozen_string_literal: true

module SkillfindTech
  class Question < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'questions'

    has_many :answers, class_name: '::SkillfindTech::QuestionAnswer', foreign_key: :question_id
  end
end
