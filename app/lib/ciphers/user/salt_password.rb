# frozen_string_literal: true

module Ciphers
  module User
    class SaltPassword
      def initialize(password:, salt:)
        @password = password
        @salt = salt
      end

      def call
        Digest::SHA512.new.base64digest(password + salt + Rails.application.secrets.password_salt)
      end

      private

      attr_reader :password, :salt
    end
  end
end
