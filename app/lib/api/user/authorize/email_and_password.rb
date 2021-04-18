# frozen_string_literal: true

module Api
  module User
    module Authorize
      class EmailAndPassword < Grape::API
        desc 'Signs in a User with Email & Password.'
        params do
          requires :email, type: String, desc: 'User\'s email.'
          requires :password, type: String, desc: 'User\'s password'
        end
        put do
          ::Commands::User::Authorize::EmailAndPassword.new(params.merge(site_name: site_name)).call
          camelize(::Queries::User::SingleByEmail.new(email: params[:email], site_name: site_name).call)
        rescue ActiveRecord::RecordNotFound, ::Commands::User::Authorize::EmailAndPassword::PasswordError
          error!('Invalid email or password.', 400)
        end
      end
    end
  end
end
