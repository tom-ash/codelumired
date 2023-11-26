# frozen_string_literal: true

module SkillfindTech
  class QuestionAnswer < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'question_answers'

    belongs_to :question
  end
end
