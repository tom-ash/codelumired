# frozen_string_literal: true

module SoundofIt
  class JobSkill < ApplicationRecord
    establish_connection :soundof_it

    self.table_name = 'job_skills'

    belongs_to :job
    belongs_to :skill

    validates :user, presence: true
    validates :skill, presence: true
    validates :level, presence: true, numericality: true
  end
end
