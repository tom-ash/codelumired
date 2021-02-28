module Codelumi
  class RouteDataController < Codelumi::ApplicationController
    include Sites
    include Responses

    def show
      route_url = request.headers['Route-Url']
      track = request.headers['Track']
      state = {}
      meta = {}
      is_ssr = request.headers['Type'] == 'ssr'
      lang = request.headers['Lang']

      if ['root'].include?(track)
        # TODO
      end

      if track == 'page/create'
        state.merge!(
          'page/create/data': { names: Page.all.pluck(:name).uniq.sort }
        )
      end

      if track == 'page/edit'
        page_name_or_url = route_url.match(/^(edit-page|edytuj-strone)\/(.+)$/)[2]
        page = Page.find_by(name: page_name_or_url, lang: lang) || Page.find_by(url: page_name_or_url)
        urls = Page.where(name: page.name).pluck(:lang, :url).to_h
        page = page.slice(:name, :url, :body, :style, :title, :description, :keywords, :canonical_url, :picture, :meta, :lang).merge(lang_ver_urls: urls)

        state.merge!(
          'page/edit': page.deep_transform_keys { |key| key.to_s.camelize(:lower) }
        )
      end

      if track == 'page/index/manage'
        pages = Page.all.select(:name, :lang, :url)

        parsed_pages = {}
        pages.each do |page|
          urls = parsed_pages[page.name] || {}
          urls[page.lang] = page.url
          parsed_pages[page.name] = urls
        end

        state.merge!(
          'page/index/data': { pages: parsed_pages },
          'page/index/inputs': { name: '' }
        )
      end

      if track == 'page/show'
        page = Page.find_by(url: route_url)

        return render json: {}, status: 404 if page.blank?

        urls = Page.where(name: page.name).pluck(:lang, :url).to_h

        meta = {
          title: page.title,
          description: page.description,
          keywords: page.keywords,
          canonical_url: page.canonical_url,
          picture: page.picture,
          lang: page.lang
        }

        state.merge!(
          'page/show/data': page.slice(
            :name, :url, :body, :style, :title, :description,
            :keywords, :canonical_url, :picture, :meta, :lang).merge(lang_ver_urls: urls
          ).deep_transform_keys { |key| key.to_s.camelize(:lower) },
          lang: page.lang
        )
      end

      if is_ssr
        state.merge!(
          'assets/svgs': SvgsSerializer.new(site: 'Warsawlease').serialize
        )
      end

      response = {
        metaData: meta.deep_transform_keys { |key| key.to_s.camelize(:lower) },
        state: state
      }

      render json: response.as_json
    end
  end
end
