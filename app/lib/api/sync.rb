# frozen_string_literal: true

module Api
  class TrackNotFoundError < StandardError; end
  class ResourceNotFoundError < StandardError; end
  class UnauthorizedError < StandardError; end

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
              request_ip: request.ip,
              device: device,
              deviceLang: deviceLang,
              isMobile: isMobile,
            }
          end

          def headers
            @headers ||= request.headers
          end

          def device
            # TODO: Add spec.
            @device ||= headers['Device']
          end

          def deviceLang
            # TODO: Add spec.
            @deviceLang ||= headers['Device-Lang']
          end

          def isMobile
            # TODO: Add spec.
            @isMobile ||= device&.match?(mobileDevicesRegex)
          end

          def mobileDevicesRegex
            @mobileDevices ||= /Android|BlackBerry|IEMobile|Opera Mini|iPad|iPhone|iPod|webOS/
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
            @state ||= {
              app: {
                lang: lang
              }
            }
          end

          def meta
            @meta ||= {
              lang: lang
            }
          end

          def listings_obsolete?
            @listings_obsolete ||= request.headers['Is-Listings-Obsolete'] == 'true'
          end
        end

        get do
          begin
            append_track_data
          rescue ::Api::TrackNotFoundError, ::Api::ResourceNotFoundError, ::Api::UnauthorizedError
            status 404

            append_track_not_found_data
          end

          append_links

          status redirect.status if redirect.present?

          camelize(state: state, meta: meta)
        end
      end
    end
  end
end
