# frozen_string_literal: true

module SkillfindTech
  class Skill < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'skills'

    has_many :selected_skills
    has_many :jobs, through: :selected_skills

    validates :name, presence: true, uniqueness: true # TODO: Add unique index to :name.
    validates :type, presence: true
  end
end
