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
              meta: meta
            }
          end

          def route_url
            @route_url ||= request.headers['Route-Url']
          end

          def track
            @track ||= request.headers['Track']
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

          def append_assets
            state.merge!('assets/svgs': ::SvgsSerializer.new(site: 'Warsawlease').serialize)
          end

          def append_user
            state.merge!('user/authorize/data': ::Serializers::User::Show.new(user: current_user, site_name: site_name).call)
          end

          def append_page
            page = site::Page.find_by(name: page_name, lang: lang)
            return if page.blank?

            state.merge!('page/show/data': ::Serializers::Page::Show.new(page: page, site_name: site_name).call)
          end

          def handle_user_tracks
            if track == 'user/edit'
              state.merge!('user/edit/data': ::Serializers::User::Edit.new(user: current_user, site_name: site_name).call)
            end
          end

          def handle_page_tracks
            if track == 'page/create'
              state.merge!('page/create/data': { names: site::Page.all.pluck(:name).uniq.sort })
            end

            if track == 'page/index/manage'
              pages = site::Page.all.select(:name, :lang, :url)

              state.merge!(
                'page/index/data': { pages: ::Serializers::Page::Index.new(pages: pages, site_name: site_name).call },
                'page/index/inputs': { name: '' }
              )
            end

            if track == 'page/show'
              page = site::Page.find_by(url: route_url)
              return error!('Page Not Found!.', 404) if page.blank?

              state.merge!('app': { lang: page.lang }, 'page/show/data': ::Serializers::Page::Show.new(page: page, site_name: site_name).call)
              meta.merge!(lang: page.lang, title: page.title, description: page.description, keywords: page.keywords, image: page.picture)
            end

            if track == 'page/edit'
              page_url = route_url.match(%r{^(edit-page|edytuj-strone)/(.+)$})[2]
              page = site::Page.find_by(url: page_url, lang: lang)

              state.merge!('page/edit': ::Serializers::Page::Show.new(page: page, site_name: site_name).call)
            end
          end
        end

        before do
          if ssr?
            append_assets
            append_user if current_user.present?
          end
          append_page if page_name.present?
          handle_user_tracks
          handle_page_tracks
        end

        get do
          camelize(state: state, meta: meta)
        end
      end
    end
  end
end
