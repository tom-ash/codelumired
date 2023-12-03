# frozen_string_literal: true

module SkillfindTech
  class Category < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'categories'

    has_many :questions#, class_name: '::SkillfindTech::Question'#, foreign_key: :question_id
  end
end
