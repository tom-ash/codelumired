# frozen_string_literal: true

module Api
  class Base < Grape::API
    format :json

    helpers do
      def site
        @site ||= Object.const_get(site_name)
      end

      def lang
        @lang ||= headers['Lang']
      end

      def email
        @email ||= params[:email]
      end

      def verification_code
        @verification_code ||= params['verification_code']
      end

      def current_user
        @current_user ||= ::Commands::User::Authorize::AccessToken.new(
          access_token: headers['Access-Token'],
          site_name: site_name
        ).call
      end

      def authorize!
        current_user
      rescue ActiveRecord::RecordNotFound, ::Commands::User::Authorize::AccessToken::AccessTokenError
        error!('Invalid access token.', 401)
      end

      def snakelize_params
        params.deep_transform_keys!(&:underscore)
      end
    end

    before { snakelize_params }
  end
end
