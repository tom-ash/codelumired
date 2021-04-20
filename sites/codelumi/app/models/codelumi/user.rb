# frozen_string_literal: true

module Codelumi
  class User < ApplicationRecord
    establish_connection :codelumi

    self.table_name = 'users'

    validates :encrypted_access_token, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :hashed_password, presence: true
    validates :password_salt, presence: true
    validates :consents, presence: true
    validates :first_name, presence: true, if: :private_account?
    validates :business_name, presence: true, if: :professional_account?

    has_many :pages, foreign_key: :author_id, dependent: :destroy

    def private_account?
      account_type == 'private'
    end

    def professional_account?
      account_type == 'professional'
    end

    def unloggable
      %w[encrypted_access_token access_token_date verification verification_code_iv]
    end
  end
end
