# frozen_string_literal: true

module SkillfindTech
  module Commands
    module Users
      class Create
        def initialize(attrs)
          @email = attrs[:email_address]
          @password = attrs[:password]
        end

        def call
          return if user.confirmed_at.present?

          ::Ciphers::User::HashPassword.new(user: user, password: password).call

          user.save!
        end

        private

        attr_reader :email, :password

        def user
          @user ||= ::SkillfindTech::User.new(
            email: email,
            change_log: [],
          )
        end

        def site
          @site ||= Object.const_get(constantized_site_name)
        end
      end
    end
  end
end
