# frozen_string_literal: true

module Api
  class Sync < Grape::API
    def self.inherited(subclass)
      super

      subclass.instance_eval do
        helpers do
          def attrs
            @attrs ||= {
              url: route_url,
              lang: lang,
              langs: langs,
              params: params,
              current_user: current_user,
              state: state,
              meta: meta,
              site: site,
              site_name: site_name,
              constantized_site_name: constantized_site_name,
              redirect: redirect,
              domain_url: domain_url,
              image: image,
              page: page,
              is_ssr: ssr?,
            }
          end

          def route_url
            @route_url ||= request.headers['Route-Url']
          end

          def ssr?
            request.headers['Type'] == 'ssr'
          end

          def access_token
            @access_token ||= request.headers['Access-Token']
          end

          def state
            @state ||= { 'app': { lang: lang } }
          end

          def meta
            @meta ||= { lang: lang }
          end

          def append_user
            state.merge!('user/authorize/data': ::Serializers::User::Show.new(user: current_user, constantized_site_name: constantized_site_name).call)
          end

          def append_page
            return if page.blank?

            state.merge!(
              'page/show/data': ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call,
              links: {
                'page/edit': {
                  path: page.edit_link
                }
              }
            )
          end
        end

        before do
          if ssr?
            append_user if current_user.present?
          end
          append_page
        end

        get do
          status redirect.status if redirect.present?

          camelize(state: state, meta: meta)
        end
      end
    end
  end
end
