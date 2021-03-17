# frozen_string_literal: true

module Commands
  module User
    class Verify
      class CodeMismatchError < StandardError; end

      def initialize(user:, namespace:, verification_code:)
        @user = user
        @namespace = namespace
        @verification_code = verification_code
        @key = Rails.application.secrets.verification_code_key
      end

      def call
        raise CodeMismatchError unless codes_match?
      end

      private

      attr_reader :user, :namespace, :verification_code, :key, :iv

      def codes_match?
        verification_code == decrypted_code
      end

      def decrypted_code
        @decrypted_code ||= ::Ciphers::Decrypt.new(
          encrypted_record: last_namespaced_verification_bundle['encrypted_code'],
          key: key,
          iv: last_namespaced_verification_bundle['encrypted_code_iv']
        ).call
      end

      def last_namespaced_verification_bundle
        @last_namespaced_verification_bundle ||= user.verification.select do |verification_bundle|
          verification_bundle['namespace'] == namespace
        end.last
      end
    end
  end
end
