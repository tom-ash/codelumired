# frozen_string_literal: true

module Ciphers
  module User
    class HashPassword
      def initialize(user:, password:)
        @password = password
        @user = user
      end

      def call
        user.assign_attributes(hashed_password: hashed_password, password_salt: salt)
      end

      private

      attr_reader :password, :user

      def hashed_password
        BCrypt::Password.create(salted_password, cost: 12)
      end

      def salted_password
        ::Ciphers::User::SaltPassword.new(password: password, salt: salt).call
      end

      def salt
        @salt ||= SecureRandom.hex(32)
      end
    end
  end
end
