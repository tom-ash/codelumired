# frozen_string_literal: true

module Api
  module User
    module Create
      class EmailAndPassword < Grape::API
        helpers ::MapawynajmuPl::ProtocolAndDomain

        params do
          optional :business_name, type: String
          requires :email_address, type: String
          requires :password, type: String
          requires :country_code, type: String
          requires :phone_number, type: String
          requires :consents, type: Array do
            requires :type, type: String
            requires :granted, type: Boolean
            requires :displayed_text, type: String
          end
        end
        post do
          user = ::Commands::User::Create::EmailAndPassword.new(
            params.merge(
              email: email,
              constantized_site_name: constantized_site_name,
            ),
          ).call

          verificationCode = rand(1000..9999).to_s

          ::Mailers::Verification.new(
            email: email,
            namespace: 'user/create/email-and-password',
            lang: lang,
            verification_code: verificationCode,
          ).send

          verificationToken = {
            verificationCode: verificationCode,
            userId: user.id,
          }
          encodedVerificationToken = ::Ciphers::Jwt::Encoder.new(verificationToken).call

          {
            verificationToken: encodedVerificationToken,
            userId: user.id,
            path: site::Api::Tracks::User::Create::Verification::Meta::UNLOCALIZED_PATH[lang.to_sym],
          }
        end

        params do
          requires :verification_token, type: String
          requires :verification_code, type: String
        end
        put do
          decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(params['verification_token']).call
          error!('Invalid verification code!', 422) if decodedVerificationToken['verificationCode'] != params['verification_code']

          user_id = decodedVerificationToken['userId']
          user = ::MapawynajmuPl::User.find(user_id)
          error!('Invalid verification code!', 422) if user.verified?

          ActiveRecord::Base.transaction do
            ::Commands::User::Update::Attribute.new(
              user_id: user.id,
              name: 'email_verified_at',
              value: Time.zone.now,
              constantized_site_name: constantized_site_name,
            ).call

            site::Commands::User::Confirm.new(user_id: user.id).call
          end

          encodedAccessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call

          listing_confirmation_href = begin
            listing_confirmation_path = user.announcements.last&.summary_path(lang.to_sym)
            "#{protocol_and_domain}/#{listing_confirmation_path}" if listing_confirmation_path.present?
          end

          user_confirmation_href = ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Linker.new(
            lang.to_sym,
            user_id: user.id,
          ).call[:href]

          href = listing_confirmation_href || user_confirmation_href

          {
            accessToken: encodedAccessToken,
            href: href,
          }
        rescue StandardError
          error!('Invalid confirmation token or verification code!', 422)
        end
      end
    end
  end
end
