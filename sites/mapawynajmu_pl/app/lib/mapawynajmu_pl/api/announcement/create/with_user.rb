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
            ::Commands::User::Create::EmailAndPassword.new(params[:user].merge(constantized_site_name: constantized_site_name)).call
            user = MapawynajmuPl::User.find_by!(email: params[:user][:email])
            announcement_attrs = { attrs: params[:announcement].merge(confirmed: false), user_id: user.id }
            ::MapawynajmuPl::Commands::Announcement::Create.new(announcement_attrs).call
            ::Mailers::Verification.new(email: params[:user][:email], namespace: 'user/create/email-and-password', lang: lang, constantized_site_name: constantized_site_name).send
            camelize(
              confirmation_token: ::Ciphers::User::DecryptConfirmationToken.new(user.encrypted_confirmation_token).call,
              path: ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta::UNLOCALIZED_PATH[lang.to_sym]
            )
          end
        end
      end
    end
  end
end
