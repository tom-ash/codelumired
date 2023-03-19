# frozen_string_literal: true

module Api
  class Base < Grape::API
    def self.inherited(subclass)
      super

      subclass.instance_eval do
        format :json

        helpers do
          def snakelize_params
            params.deep_transform_keys!(&:underscore)
          end

          def camelize(response)
            response.as_json.deep_transform_keys do |key|
              next key if key.include?('/')
              next key if key[0].match(/[A-Z]/)

              key.to_s.camelize(:lower)
            end
          end

          def site
            @site ||= Object.const_get(constantized_site_name)
          end

          def track_and_lang
            @track_and_lang ||= begin
              track_paths.find do |track, path|
                return { track: track, lang: :pl } if path[:pl]&.match(route_url)
                return { track: track, lang: :en } if path[:en]&.match(route_url)
                return { track: 'page/show', lang: page.lang.to_sym } if page.present?
                return { track: 'redirect', lang: :en } if redirect.present? # TODO: Add :lang to :redirect.
              end

              status 404
              { track: 'page/not-found', lang: :pl }
            end
          end

          def page
            @page ||= site::Page.find_by(url: route_url)
          end

          def redirect
            @redirect ||= site::Redirect.find_by(original_url: route_url)
          end

          def track
            @track ||= track_and_lang[:track]
          end

          def lang
            @lang ||= headers['Lang'] || track_and_lang[:lang]
          end

          def email
            @email ||= params[:email_address] || params[:email]
          end

          def verification_code
            @verification_code ||= params['verification_code']
          end

          def authenticated_user
            begin
              access_token = headers['Access-Token']
              return if access_token.blank? || access_token == 'null'

              private_key = RbNaCl::Signatures::Ed25519::SigningKey.new(ENV['JWT_SECRET'])
              public_key = private_key.verify_key

              user_id = (JWT.decode access_token, public_key, true, algorithm: 'ED25519')[0]['id']

              @authenticated_user ||= site::User.find(user_id)
            rescue StandardError
              nil
            end
          end

          def authorize!
            error!('Invalid access token.', 401) if authenticated_user.blank?
          end

          def authorize_for_page!
            error!('Unauthorized!.', 401) unless authenticated_user&.role == 'admin'
          end

          def sitemaps
            [
              # TODO
            ]
          end
        end

        before { snakelize_params }

        mount ::Api::User::Create::EmailAndPassword => 'user/create/email-and-password'
        mount ::Api::User::Authorize::EmailAndPassword => 'user/auth/email-and-password'
        mount ::Api::User::Update::Attribute => 'user/update/:name'
        mount ::Api::User::Update::Password => 'user/update/password'
        mount ::Api::User::Update::Email => 'user/update/email'
        mount ::Api::User::Update::Phone => 'user/update/phone'
        mount ::Api::User::Delete => 'user/delete'
        mount ::Api::RemoteAsset::PresignedGet => 'remote-asset/presigned-get'
        mount ::Api::RemoteAsset::PresignedPost => 'remote-asset/presigned-post'
        mount ::Api::Page::Create => 'page/create'
        mount ::Api::Page::Update => 'page/update'
        mount ::Api::Image::Update => 'image/update'
        mount ::Api::Image::Create => 'image/create'
        mount ::Api::Storage::S3PresignedPost => 'storage/s3-presigned-post'
      end
    end
  end
end
