# frozen_string_literal: true

module SkillfindTech
  class PostingApplication < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'posting_applications'

    belongs_to :posting

    validates :posting, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
  end
end
