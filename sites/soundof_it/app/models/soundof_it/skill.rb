# frozen_string_literal: true

module SoundofIt
  class Skill < ApplicationRecord
    establish_connection :soundof_it

    self.table_name = 'skills'

    has_and_belongs_to_many :jobs

    validates :added_by_id, presence: true
    validates :name, presence: true, uniqueness: true # TODO: Add unique index to :name.
    validates :type, presence: true
  end
end
