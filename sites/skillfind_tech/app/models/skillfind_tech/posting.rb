# frozen_string_literal: true

module SkillfindTech
  class Posting < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'postings'

    belongs_to :user

    has_many :selected_skills
    has_many :skills, through: :selected_skills

    validates :user, presence: true
    validates :views, presence: true, numericality: true
    validates :company_size, presence: true
    validates :cooperation_mode, presence: true
    validates :country, presence: true
    validates :locality, presence: true
    validates :b2b, inclusion: { in: [true, false] }
    validates :b2b_min, numericality: true, allow_nil: true
    validates :b2b_max, numericality: true, allow_nil: true
    validates :employment, inclusion: { in: [true, false] }
    validates :employment_min, numericality: true, allow_nil: true
    validates :employment_max, numericality: true, allow_nil: true
  end
end
