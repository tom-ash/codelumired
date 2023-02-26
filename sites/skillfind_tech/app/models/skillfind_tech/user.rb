# frozen_string_literal: true

module SkillfindTech
  class User < ApplicationRecord
    establish_connection :skillfind_tech

    self.table_name = 'users'

    validates :email, presence: true, uniqueness: true
    validates :hashed_password, presence: true
    validates :password_salt, presence: true

    has_many :pages, foreign_key: :author_id, dependent: :destroy
    # has_many :jobs, dependent: :destroy

    def private_account?
      account_type == 'private'
    end

    def professional_account?
      account_type == 'professional'
    end

    def unloggable
      %w[verification verification_code_iv]
    end
  end
end
