# frozen_string_literal: true

module Api
  module User
    module Update
      class Password < Grape::API
        namespace 'verification' do
          params { requires :email, type: String }
          put do
            ::Mailers::Verification.new(email: email, namespace: 'user/update/password', lang: lang, site_name: site_name).send
          end
        end

        namespace 'verify' do
          params do
            requires :email, type: String
            requires :verification_code, type: String
          end
          put do
            ::Commands::User::Verify.new(user: site::User.find_by!(email: params[:email]), namespace: 'user/update/password', verification_code: verification_code).call
          rescue ::Commands::User::Verify::CodeMismatchError
            error!('Invalid email or verification code!', 422)
          end
        end

        namespace do
          desc 'Resets the password.'
          params do
            requires :email, type: String
            requires :password, type: String
            requires :verification_code, type: String
          end
          put do
            current_user = site::User.find_by!(email: params[:email])
            ::Commands::User::Verify.new(user: current_user, namespace: 'user/update/password', verification_code: verification_code).call
            ::Commands::User::Update::Password.new(user_id: current_user.id, password: params[:password], site_name: site_name).call
          rescue ::Commands::User::Verify::CodeMismatchError
            error!('Invalid email, password or verification code!.', 422)
          end
        end
      end
    end
  end
end
