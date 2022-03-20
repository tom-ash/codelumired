# frozen_string_literal: true

module SoundofIt
  class Job < ApplicationRecord
    establish_connection :soundof_it

    self.table_name = 'jobs'

    # has_and_belongs_to_many :skills
    belongs_to :user

    has_many :job_skills
    has_many :skills, through: :job_skills

    # Non-validated fields: sublocality, street, description
    validates :user, presence: true
    validates :views, presence: true, numericality: true
    validates :company_name, presence: true
    validates :company_size, presence: true
    validates :remote, inclusion: { in: [true, false] }
    validates :hybrid, inclusion: { in: [true, false] }
    validates :office, inclusion: { in: [true, false] }
    validates :country, presence: true
    validates :locality, presence: true
    validates :employment, inclusion: { in: [true, false] }
    validates :b2b, inclusion: { in: [true, false] }
    # Add :mandate.
    validates :employment_min, numericality: true, allow_nil: true
    validates :employment_max, numericality: true, allow_nil: true
    validates :b2b_min, numericality: true, allow_nil: true
    validates :b2b_max, numericality: true, allow_nil: true
  end
end
