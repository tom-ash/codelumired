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
              authenticated_user: authenticated_user,
              state: state,
              meta: meta,
              site: site,
              site_name: site_name,
              constantized_site_name: constantized_site_name,
              redirect: redirect,
              domain_url: domain_url,
              api_url: api_url,
              image: image,
              page: page,
              is_ssr: ssr?,
              listings_obsolete: listings_obsolete?,
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

          def listings_obsolete?
            @listings_obsolete ||= request.headers['Is-Listings-Obsolete'] == 'true'
          end
        end

        before {}

        get do
          status redirect.status if redirect.present?

          camelize(state: state, meta: meta)
        end
      end
    end
  end
end
