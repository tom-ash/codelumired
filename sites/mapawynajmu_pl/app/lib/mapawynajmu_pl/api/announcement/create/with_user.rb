# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Announcement
      module Create
        class WithUser < Grape::API
          helpers MapawynajmuPl::Api::Announcement::Helpers::Attrs
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

            announcement_attrs = {
              user_id: user.id,
              attrs: params[:announcement].merge(user_verified: false),
            }

            ::MapawynajmuPl::Commands::Announcement::Create.new(announcement_attrs).call

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
            encodedVerificationToken = ::JWT::Encoder.new(verificationToken).call

            {
              verificationToken: encodedVerificationToken,
              path: ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta::UNLOCALIZED_PATH[lang.to_sym],
            }
          end
        end
      end
    end
  end
end
