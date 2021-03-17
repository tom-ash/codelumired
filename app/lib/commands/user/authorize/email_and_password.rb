# frozen_string_literal: true

module Commands
  module User
    module Authorize
      class Authorize::EmailAndPassword
        class PasswordError < StandardError; end

        def initialize(attrs)
          @email = attrs[:email]
          @password = attrs[:password]
          @site_name = attrs[:site_name]
        end

        def call
          raise PasswordError unless BCrypt::Password.new(user.hashed_password) == salted_password

          # TODO: update! :last_authorized_at
          user
        end

        private

        attr_reader :email, :password, :site_name

        def user
          @user ||= site::User.find_by!(email: email)
        end

        def hashed_password
          @hashed_password ||= user.hashed_password
        end

        def salted_password
          ::Ciphers::User::SaltPassword.new(password: password, salt: salt).call
        end

        def salt
          @salt ||= user.password_salt
        end

        def site
          @site ||= Object.const_get(site_name)
        end
      end
    end
end
end
