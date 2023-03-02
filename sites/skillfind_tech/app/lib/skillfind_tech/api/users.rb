# frozen_string_literal: true

module SkillfindTech
  module Api
    class Users < Grape::API
      params do
        requires :email_address, type: String
        requires :password, type: String
      end
      post do
        user = ::SkillfindTech::Commands::Users::Create.new(params).call
        private_key = RbNaCl::Signatures::Ed25519::SigningKey.new(ENV['JWT_SECRET'])
        payload = { id: user.id }
        JWT.encode payload, private_key, 'ED25519'
      end

      params do
        requires :token, type: String
      end
      post 'auth' do
        private_key = RbNaCl::Signatures::Ed25519::SigningKey.new(ENV['JWT_SECRET'])
        public_key = private_key.verify_key
        token = params['token']

        JWT.decode token, public_key, true, algorithm: 'ED25519'
      end
    end
  end
end
