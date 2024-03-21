# frozen_string_literal: true

module SkillfindTech
  class Posting < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'postings'

    # has_and_belongs_to_many :skills
    belongs_to :user

    has_many :selected_skills
    has_many :skills, through: :selected_skills

    # Non-validated fields: sublocality, street, description
    validates :user, presence: true
    validates :views, presence: true, numericality: true
    validates :company_name, presence: true
    validates :company_size, presence: true
    validates :cooperation_mode, presence: true
    validates :country, presence: true
    validates :locality, presence: true
    validates :employment, inclusion: { in: [true, false] }
    validates :b2b, inclusion: { in: [true, false] }
    # Add :mandate.
    validates :employment_min, numericality: true, allow_nil: true
    validates :employment_max, numericality: true, allow_nil: true
    validates :b2b_min, numericality: true, allow_nil: true
    validates :b2b_max, numericality: true, allow_nil: true

    # def selected_skills
    #   coveted_skills.map do |coveted_skill|
    #     {
    #       name: coveted_skill.skill.name,
    #       level: coveted_skill.level,
    #     }
    #   end
    # end
  end
end
