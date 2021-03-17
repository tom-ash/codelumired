# frozen_string_literal: true

module Commands
  module User
    module Update
      class Verification
        def initialize(user:, namespace:)
          @user = user
          @namespace = namespace
          @key = Rails.application.secrets.verification_code_key
        end

        def call
          user.assign_attributes(verification: verification)
          code
        end

        def build_and_persist
          user.assign_attributes(verification: verification)
          user.save!
          code
        end

        private

        attr_reader :user, :namespace, :key

        def code
          @code ||= rand(1000..9999).to_s
        end

        def verification
          @verification ||= (user.verification || []).push(
            namespace: namespace,
            generated_at: Time.now,
            encrypted_code: encrypted_code_data[:encrypted_record],
            encrypted_code_iv: encrypted_code_data[:iv]
          )
        end

        def encrypted_code_data
          @encrypted_code_data ||= ::Ciphers::Encrypt.new(record: code, key: key).call
        end
      end
    end
  end
end
