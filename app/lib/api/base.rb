# frozen_string_literal: true

module Api
  class Base < Grape::API
    format :json

    helpers do
      def snakelize_params
        params.deep_transform_keys!(&:underscore)
      end

      def camelize(response)
        response.as_json.deep_transform_keys do |key|
          key.exclude?('/') ? key.to_s.camelize(:lower) : key
        end
      end

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
        error!('Invalid access token.', 401) if current_user.blank?
      end

      def authorize_for_page!
        error!('Unauthorized!.', 401) unless current_user&.role == 'admin'
      end
    end

    before { snakelize_params }
  end
end
