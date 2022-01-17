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
          ::Commands::User::Authorize::EmailAndPassword.new(params.merge(constantized_site_name: constantized_site_name)).call
          camelize(::Queries::User::SingleByEmail.new(email: params[:email], constantized_site_name: constantized_site_name).call).merge(
            site::Api::Tracks::Root::Linker.new(lang.to_sym).call
          )
        rescue ActiveRecord::RecordNotFound, ::Commands::User::Authorize::EmailAndPassword::PasswordError
          error!('Invalid email or password.', 400)
        end
      end
    end
  end
end
