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
              key.exclude?('/') ? key.to_s.camelize(:lower) : key
            end
          end

          def site
            @site ||= Object.const_get(constantized_site_name)
          end

          def track_and_lang
            @track_and_lang ||= begin
              track_paths.find do |track, path|
                return { track: track, lang: :pl } if path[:pl] && path[:pl].match(route_url)
                return { track: track, lang: :en } if path[:en].match(route_url)
                return { track: 'page/show', lang: page.lang.to_sym } if page.present?
              end

              status 404
              { track: 'page/not-found', lang: :pl }
            end
          end

          def page
            @page ||= site::Page.find_by(url: route_url)
          end

          def track
            @track ||= track_and_lang[:track]
          end

          def lang
            @lang ||= headers['Lang'] || track_and_lang[:lang]
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
              constantized_site_name: constantized_site_name
            ).call
          end

          def authorize!
            error!('Invalid access token.', 401) if current_user.blank?
          end

          def authorize_for_page!
            error!('Unauthorized!.', 401) unless current_user&.role == 'admin'
          end

          def sitemaps
            [
              # TODO
            ]
          end
        end

        before { snakelize_params }

        mount ::Api::User::Create::EmailAndPassword => 'user/create/email-and-password'
        mount ::Api::User::Authorize::EmailAndPassword => 'user/authorize/email-and-password'
        mount ::Api::User::Authorize::AccessToken => 'user/authorize/access-token'
        mount ::Api::User::Update::GenericAttr => 'user/update/generic-attr/:name'
        mount ::Api::User::Update::Password => 'user/update/password'
        mount ::Api::User::Update::Email => 'user/update/email'
        mount ::Api::User::Update::Phone => 'user/update/phone'
        mount ::Api::User::Delete => 'user/delete'
        mount ::Api::RemoteAsset::PresignedGet => 'remote-asset/presigned-get'
        mount ::Api::RemoteAsset::PresignedPost => 'remote-asset/presigned-post'
        mount ::Api::Page::Create => 'page/create'
        mount ::Api::Page::Update => 'page/update'
      end
    end
  end
end
