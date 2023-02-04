# frozen_string_literal: true

module Api
  module User
    module Create
      class EmailAndPassword < Grape::API
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
          ::Commands::User::Create::EmailAndPassword.new(
            params.merge(
              email: email,
              constantized_site_name: constantized_site_name,
            ),
          ).call

          ::Mailers::Verification.new(
            email: email,
            namespace: 'user/create/email-and-password',
            lang: lang,
            constantized_site_name: constantized_site_name,
          ).send

          camelize(
            confirmation_token: ::Ciphers::User::DecryptConfirmationToken.new(
              site::User.find_by(email: email).encrypted_confirmation_token,
            ).call,
          ).merge(
            path: site::Api::Tracks::User::Create::Verification::Meta::UNLOCALIZED_PATH[lang.to_sym],
          )
        end

        params do
          requires :confirmation_token, type: String
          requires :verification_code, type: String
        end
        put do
          user = ::Queries::User::SingleByConfirmationToken.new(
            confirmation_token: params[:confirmation_token],
            constantized_site_name: 'MapawynajmuPl',
          ).call

          error!('Invalid confirmation token or verification code!', 422) if user.confirmed?

          email_confirmed_at = Time.zone.now

          ActiveRecord::Base.transaction do
            ::Commands::User::Verify.new(
              user: user,
              namespace: 'user/create/email-and-password',
              verification_code: verification_code,
            ).call

            ::Commands::User::Update::GenericAttr.new(
              user_id: user.id,
              name: 'confirmed',
              value: true,
              constantized_site_name: constantized_site_name,
            ).call

            ::Commands::User::Update::GenericAttr.new(
              user_id: user.id,
              name: 'email_confirmed_at',
              value: email_confirmed_at,
              constantized_site_name: constantized_site_name,
            ).call

            site::Commands::User::Confirm.new(user_id: user.id).call
          end

          listing_confirmation_href = begin
            listing_confirmation_path = user.announcements.last&.summary_path(lang.to_sym)
            "#{MAPAWYNAJMU_PL_DEV_URL}/#{listing_confirmation_path}" if listing_confirmation_path.present?
          end

          user_confirmation_href = ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Linker.new(
            lang.to_sym,
            user_id: user.id,
          ).call[:href]

          href = listing_confirmation_href || user_confirmation_href

          camelize(
            ::Queries::User::SingleByEmail.new(
              email: user.email,
              constantized_site_name: constantized_site_name,
            ).call,
          ).merge(
            href: href,
          )
        rescue StandardError
          error!('Invalid confirmation token or verification code!', 422)
        end
      end
    end
  end
end
