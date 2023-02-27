# frozen_string_literal: true

module Api
  module User
    module Update
      class Password < Grape::API
        namespace 'verification' do
          params do
            requires :email, type: String
          end
          put do
            verificationCode = rand(1000..9999).to_s
            userId = site::User.find_by(email: params[:email])&.id
            verificationToken = {
              verificationCode: verificationCode,
              userId: userId,
            }
            encodedVerificationToken = ::JWT::Encoder.new(verificationToken).call

            ::Mailers::Verification.new(
              email: email,
              namespace: 'user/update/password',
              lang: lang,
              verification_code: verificationCode,
            ).send

            encodedVerificationToken
          end
        end

        namespace 'verify' do
          params do
            requires :verification_token, type: String
          end
          put do
            decodedVerificationToken = ::JWT::Decoder.new(params['verification_token']).call
            error!('Verification code invalid.', 422) if decodedVerificationToken['verificationCode'] != params['verification_code']
          rescue StandardError
            error!('Invalid email or verification code!', 422)
          end
        end

        namespace do
          desc 'Resets the password.'
          params do
            requires :verification_token, type: String
            requires :password, type: String
          end
          put do
            decodedVerificationToken = ::JWT::Decoder.new(params['verification_token']).call
            error!('Verification code invalid.', 422) if decodedVerificationToken['verificationCode'] != params['verification_code']

            ::Commands::User::Update::Password.new(
              user_id: decodedVerificationToken['userId'],
              password: params[:password],
              constantized_site_name: constantized_site_name,
            ).call
          rescue StandardError
            error!('Invalid email, password or verification code!.', 422)
          end
        end
      end
    end
  end
end
