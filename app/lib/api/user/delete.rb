# frozen_string_literal: true

module Api
  module User
    class Delete < Grape::API
      namespace 'verification' do
        before { authorize! }
        put do
          verificationCode = rand(1000..9999).to_s
          verificationToken = {
            verificationCode: verificationCode,
            userId: authenticated_user.id,
          }
          encodedVerificationToken = ::Ciphers::Jwt::Encoder.new(verificationToken).call

          ::Mailers::Verification.new(
            email: email,
            namespace: 'user/delete',
            lang: lang,
            verification_code: verificationCode,
          ).send

          encodedVerificationToken
        end
      end

      namespace do
        before { authorize! }
        params do
          requires :verification_token, type: String
          requires :verification_code, type: String
        end
        delete do
          decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(params['verification_token']).call
          error!('Verification code invalid.', 422) if decodedVerificationToken['verificationCode'] != params['verification_code']
          error!('Verification code user mismatch.', 422) if decodedVerificationToken['userId'] != authenticated_user.id

          ::Commands::User::Delete.new(user_id: authenticated_user.id, constantized_site_name: constantized_site_name).call
          site::Api::Tracks::Root::Linker.new(lang.to_sym).call
        end
      end
    end
  end
end
