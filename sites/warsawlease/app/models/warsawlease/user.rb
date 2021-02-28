# frozen_string_literal: true

module Warsawlease
  class User < ApplicationRecord
    establish_connection :warsawlease
    self.table_name = 'users'

    validates :encrypted_access_token, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :hashed_password, presence: true
    validates :password_salt, presence: true
    validates :consents, presence: true
    validates :phone, presence: true
    validates :first_name, presence: true, if: :private_account?
    validates :business_name, presence: true, if: :professional_account?
    validates :showcase, presence: true

    has_many :announcements, dependent: :destroy
    
    before_update :log_changes

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
