# frozen_string_literal: true

module Api
  module User
    module Update
      class Email < Grape::API
        before { authorize! }

        namespace 'current/verification' do
          put do
            ::Mailers::Verification.new(email: current_user.email, namespace: 'user/update/email/current', lang: lang, constantized_site_name: constantized_site_name).send
          end
        end

        namespace 'current/verify' do
          params { requires :verification_code, type: String }
          put do
            ::Commands::User::Verify.new(user: current_user, namespace: 'user/update/email/current', verification_code: verification_code).call
          rescue ::Commands::User::Verify::CodeMismatchError
            error!('Invalid email or verification code!', 422)
          end
        end

        namespace 'new/verification' do
          params { requires :email, type: String }
          put do
            ::Mailers::Verification.new(user: current_user, email: params[:email], namespace: 'user/update/email/new', lang: lang, constantized_site_name: constantized_site_name).send
          end
        end

        namespace 'new/verify' do
          params { requires :verification_code, type: String }
          put do
            ::Commands::User::Verify.new(user: current_user, namespace: 'user/update/email/new', verification_code: verification_code).call
          rescue ::Commands::User::Verify::CodeMismatchError
            error!('Invalid email or verification code!', 422)
          end
        end

        namespace do
          params do
            requires :current_email, type: String
            requires :current_email_verification_code, type: String
            requires :new_email, type: String
            requires :new_email_verification_code, type: String
            requires :client_hashed_password, type: String
            requires :client_rehashed_password, type: String
          end
          put do
            ::Commands::User::Authorize::EmailAndPassword.new(email: params[:current_email], password: params[:client_hashed_password], constantized_site_name: constantized_site_name).call
            ::Commands::User::Verify.new(user: current_user, namespace: 'user/update/email/current', verification_code: params[:current_email_verification_code]).call
            ::Commands::User::Verify.new(user: current_user, namespace: 'user/update/email/new', verification_code: params[:new_email_verification_code]).call
            ActiveRecord::Base.transaction do
              ::Commands::User::Update::GenericAttr.new(user_id: current_user.id, name: 'email', value: params[:new_email], constantized_site_name: constantized_site_name).call
              ::Commands::User::Update::Password.new(user_id: current_user.id, password: params[:client_rehashed_password], constantized_site_name: constantized_site_name).call
            end
          rescue ActiveRecord::RecordNotFound, ::Commands::User::Authorize::EmailAndPassword::PasswordError, ::Commands::User::Verify::CodeMismatchError
            error!('Invalid email, password or verification code!', 422)
          end
        end
      end
    end
  end
end
