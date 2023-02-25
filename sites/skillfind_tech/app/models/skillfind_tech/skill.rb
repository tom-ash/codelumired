# frozen_string_literal: true

module SkillfindTech
  class Skill < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'skills'

    has_many :coveted_skills
    has_many :jobs, through: :coveted_skills

    validates :added_by_id, presence: true
    validates :name, presence: true, uniqueness: true # TODO: Add unique index to :name.
    validates :type, presence: true
  end
end
