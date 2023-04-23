# frozen_string_literal: true

module Api
  module User
    module Update
      class Email < Grape::API
        before { authorize! }

        namespace 'current/verification' do
          put do
            currentEmailVerificationCode = rand(1000..9999).to_s

            ::Mailers::Verification.new(
              email: email,
              namespace: 'user/update/email/current',
              lang: lang,
              verification_code: currentEmailVerificationCode,
            ).send

            verificationToken = {
              currentEmailVerificationCode: currentEmailVerificationCode,
              currentEmailHash: Digest::SHA256.hexdigest(email),
              userId: authenticated_user.id,
            }

            ::Ciphers::Jwt::Encoder.new(verificationToken).call
          end
        end

        namespace 'current/verify' do
          params do
            requires :verification_token, type: String
            requires :verification_code, type: String
          end
          put do
            verificationCodeFromParams = params['verification_code']
            verificationToken = params['verification_token']
            decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(verificationToken).call
            currentEmailVerificationCodeFromToken = decodedVerificationToken.currentEmailVerificationCode

            error! unless verificationCodeFromParams == currentEmailVerificationCodeFromToken
          rescue StandardError
            error!('Verification code invalid.', 422)
          end
        end

        namespace 'new/verification' do
          params do
            requires :email, type: String
            requires :verification_token, type: String
            requires :verification_code, type: String
          end
          put do
            verificationCodeFromParams = params['verification_code']
            verificationToken = params['verification_token']
            decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(verificationToken).call
            currentEmailVerificationCodeFromToken = decodedVerificationToken.currentEmailVerificationCode
            error! unless verificationCodeFromParams == currentEmailVerificationCodeFromToken

            authenticatedUserId = authenticated_user.id
            userIdFromToken = decodedVerificationToken.userId
            error! unless authenticatedUserId == userIdFromToken

            newEmailVerificationCode = rand(1000..9999).to_s

            ::Mailers::Verification.new(
              email: email,
              namespace: 'user/update/email/current',
              lang: lang,
              verification_code: newEmailVerificationCode,
            ).send

            newVerificationToken = {
              currentEmailVerificationCode: currentEmailVerificationCodeFromToken,
              currentEmailHash: decodedVerificationToken.currentEmailHash,
              newEmailVerificationCode: newEmailVerificationCode,
              newEmailHash: Digest::SHA256.hexdigest(email),
              userId: authenticatedUserId,
            }

            ::Ciphers::Jwt::Encoder.new(newVerificationToken).call
          end
        end

        namespace 'new/verify' do
          params do
            requires :verification_token, type: String
            requires :verification_code, type: String
          end
          put do
            verificationCodeFromParams = params['verification_code']
            verificationToken = params['verification_token']
            decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(verificationToken).call
            newEmailVerificationCodeFromToken = decodedVerificationToken.newEmailVerificationCode

            error! unless verificationCodeFromParams == newEmailVerificationCodeFromToken
          rescue StandardError
            error!('Verification code invalid.', 422)
          end
        end

        namespace do
          params do
            requires :current_email_verification_code, type: String
            requires :new_email, type: String
            requires :new_email_verification_code, type: String
            requires :current_client_hashed_password, type: String
            requires :new_client_hashed_password, type: String
          end
          put do
            verificationToken = params['verification_token']
            decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(verificationToken).call

            currentEmailVerificationCodeFromParams = params['current_email_verification_code']
            currentEmailVerificationCodeFromToken = decodedVerificationToken.currentEmailVerificationCode
            error! unless currentEmailVerificationCodeFromParams == currentEmailVerificationCodeFromToken

            newEmailVerificationCodeFromParams = params['new_email_verification_code']
            newEmailVerificationCodeFromToken = decodedVerificationToken.newEmailVerificationCode
            error! unless newEmailVerificationCodeFromParams == newEmailVerificationCodeFromToken

            authenticatedUserId = authenticated_user.id
            userIdFromToken = decodedVerificationToken.userId
            error! unless authenticatedUserId == userIdFromToken

            currentEmail = authenticated_user.email
            currentEmailHash = Digest::SHA256.hexdigest(currentEmail)
            currentEmailHashFromToken = decodedVerificationToken.currentEmailHash
            error! unless currentEmailHash == currentEmailHashFromToken

            newEmail = params['new_email']
            newEmailHash = Digest::SHA256.hexdigest(newEmail)
            newEmailHashFromToken = decodedVerificationToken.newEmailHash
            error! unless newEmailHash == newEmailHashFromToken

            ::Commands::User::Authorize::EmailAndPassword.new(
              email: currentEmail,
              password: params[:current_client_hashed_password],
              constantized_site_name: constantized_site_name,
            ).call

            ActiveRecord::Base.transaction do
              ::Commands::User::Update::Attribute.new(
                user_id: authenticatedUserId,
                name: 'email',
                value: newEmail,
                constantized_site_name: constantized_site_name,
              ).call
              ::Commands::User::Update::Password.new(
                user_id: authenticatedUserId,
                password: params[:new_client_hashed_password],
                constantized_site_name: constantized_site_name,
              ).call
            end
          rescue StandardError
            error!('Verification code invalid.', 422)
          end
        end
      end
    end
  end
end
