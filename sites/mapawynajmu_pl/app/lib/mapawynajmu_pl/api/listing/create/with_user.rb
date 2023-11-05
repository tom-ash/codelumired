# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      module Create
        class WithUser < Grape::API
          helpers MapawynajmuPl::Api::Listing::Helpers::Attrs
          helpers MapawynajmuPl::Api::User::Helpers::Attrs

          params do
            use :announcement_attrs
            use :user_attrs
          end
          post do
            email = params[:user][:email_address]

            ::Commands::User::Create::EmailAndPassword.new(
              params[:user].merge(
                email: email,
                constantized_site_name: constantized_site_name,
              ),
            ).call

            user = MapawynajmuPl::User.find_by!(email: email)

            ::MapawynajmuPl::Commands::Listing::Create.new(
              user_id: user.id,
              attrs: params[:announcement].merge(user_verified: false),
            ).call

            verificationCode = rand(1000..9999).to_s

            ::Mailers::Verification.new(
              email: email,
              namespace: 'user/create/email-and-password',
              lang: lang,
              verification_code: verificationCode,
            ).send

            decodedVerificationToken = {
              userId: user.id,
              verificationCode: verificationCode,
            }
            verificationToken = ::Ciphers::Jwt::Encoder.new(decodedVerificationToken).call
            href = ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Linker.new(lang.to_sym).call[:href]

            {
              verificationToken: verificationToken,
              href: href,
            }
          end
        end
      end
    end
  end
end
