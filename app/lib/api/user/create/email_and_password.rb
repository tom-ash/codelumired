# frozen_string_literal: true

module Api
  module User
    module Create
      class EmailAndPassword < Grape::API
        params do
          requires :email, type: String
          requires :password, type: String
          requires :first_name, type: String
          requires :country_code, type: String
          requires :phone_number, type: String
          requires :consents, type: Array do
            requires :type, type: String
            requires :granted, type: Boolean
            requires :displayed_text, type: String
          end
        end
        post do
          ::Commands::User::Create::EmailAndPassword.new(params.merge(site_name: site_name)).call
          ::Mailers::Verification.new(email: email, namespace: 'user/create/email-and-password', lang: lang, site_name: site_name).send
          nil
        end

        params do
          requires :email, type: String
          requires :verification_code, type: String
        end
        put do
          user = site::User.find_by!(email: email)
          error!('Invalid email or verification code!', 422) if user.confirmed?

          email_confirmed_at = Time.zone.now
          ActiveRecord::Base.transaction do
            ::Commands::User::Verify.new(user: user, namespace: 'user/create/email-and-password', verification_code: verification_code).call
            ::Commands::User::Update::GenericAttr.new(user_id: user.id, name: 'confirmed', value: true, site_name: site_name).call
            ::Commands::User::Update::GenericAttr.new(user_id: user.id, name: 'email_confirmed_at', value: email_confirmed_at, site_name: site_name).call
            user.announcements.last&.update!(confirmed: true)
          end
          camelize(::Queries::User::SingleByEmail.new(email: email, site_name: site_name).call)
        rescue StandardError
          error!('Invalid email or verification code!', 422)
        end
      end
    end
  end
end
