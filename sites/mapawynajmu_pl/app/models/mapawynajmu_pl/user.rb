# frozen_string_literal: true

module MapawynajmuPl
  class User < ApplicationRecord
    establish_connection :mapawynajmu_pl

    self.table_name = 'users'

    SHOWCASE_ATTRS = %w[phone_number].freeze

    validates :email, presence: true, uniqueness: true
    validates :hashed_password, presence: true
    validates :password_salt, presence: true
    validates :consents, presence: true
    validates :showcase, presence: true
    validates :business_name, presence: true, if: -> { account_type == 'business' }

    has_many :listings, class_name: '::MapawynajmuPl::Listing', foreign_key: :user_id
    has_many :pages, foreign_key: :author_id

    before_save :urlify_business_name
    before_update :log_changes, :build_showcase

    def soft_delete!
      time_now = Time.now

      listings.update_all(deleted_at: time_now)
      update!(deleted_at: Time.now)
    end

    def destroy
      raise ListingDestroyAttemptError
    end

    def destroy!
      raise ListingDestroyAttemptError
    end

    def verified?
      email_verified_at.present?
    end

    def urlify_business_name
      return unless business_name_changed?

      self.urlified_business_name = business_name.parameterize
    end

    def private_account?
      account_type == 'private'
    end

    def professional_account?
      account_type == 'professional'
    end

    def unloggable
      # TODO: Check!
      %w[]
    end

    def build_showcase
      return if (SHOWCASE_ATTRS & changes.keys).blank?

      ::MapawynajmuPl::Builders::User::Showcase.new(self).call
    end
  end
end
