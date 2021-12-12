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
              params: params,
              current_user: current_user,
              state: state,
              meta: meta,
              site: site,
              site_name: site_name
            }
          end

          def route_url
            @route_url ||= request.headers['Route-Url']
          end

          def page_name
            @page_name ||= request.headers['Page-Name']
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
            state.merge!('user/authorize/data': ::Serializers::User::Show.new(user: current_user, site_name: site_name).call)
          end

          def append_page
            page = site::Page.find_by(name: page_name, lang: lang)
            return if page.blank?

            state.merge!(
              'page/show/data': ::Serializers::Page::Show.new(page: page, site_name: site_name).call,
              links: { 'page/edit': { path: page.edit_link } }
            )
          end
        end

        before do
          if ssr?
            append_user if current_user.present?
          end
          append_page if page_name.present?
        end

        get do
          camelize(state: state, meta: meta)
        end
      end
    end
  end
end
