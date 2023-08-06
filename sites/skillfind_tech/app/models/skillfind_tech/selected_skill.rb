# frozen_string_literal: true

module SkillfindTech
  class SelectedSkill < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'selected_skills'

    belongs_to :posting
    belongs_to :skill

    validates :posting, presence: true
    validates :skill, presence: true
    validates :level, presence: true, numericality: true
  end
end
