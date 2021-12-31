# frozen_string_literal: true

module MapawynajmuPl
  class User < ApplicationRecord
    establish_connection :mapawynajmu_pl

    self.table_name = 'users'

    SHOWCASE_ATTRS = %w[first_name last_name business_name phone_number].freeze

    validates :encrypted_access_token, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :hashed_password, presence: true
    validates :password_salt, presence: true
    validates :consents, presence: true
    validates :first_name, presence: true, if: :private_account?
    validates :business_name, presence: true, if: :professional_account?
    validates :showcase, presence: true

    has_many :announcements, class_name: '::MapawynajmuPl::Announcement', foreign_key: :user_id, dependent: :destroy
    has_many :pages, foreign_key: :author_id, dependent: :destroy

    before_update :log_changes, :build_showcase

    def private_account?
      account_type == 'private'
    end

    def professional_account?
      account_type == 'professional'
    end

    def unloggable
      %w[encrypted_access_token access_token_date verification verification_code_iv]
    end

    def build_showcase
      return if (SHOWCASE_ATTRS & changes.keys).blank?

      ::MapawynajmuPl::Builders::User::Showcase.new(self).call
    end
  end
end
